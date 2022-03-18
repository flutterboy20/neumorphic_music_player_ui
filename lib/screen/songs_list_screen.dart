import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neumorphic_musicplayer_ui/model/song_details.dart';
import 'package:neumorphic_musicplayer_ui/screen/audio_player_screen.dart';
import 'package:neumorphic_musicplayer_ui/widgets/neumorphic_button.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:neumorphic_musicplayer_ui/widgets/song_card.dart';
import 'dart:convert';

import '../colors.dart';

class SongsList extends StatefulWidget {
  @override
  State<SongsList> createState() => _SongsListState();
}

class _SongsListState extends State<SongsList> {
  // Getting list of songs from json file
  Future _getSongDetails() async {
    final jsonData =
        await rootBundle.rootBundle.loadString('assets/json/songs_detail.json');
    final songList = json.decode(jsonData);
    return songList.map((data) => SongDetails.fromJson(data)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomButton(
                    primaryColor: primarybuttonColor,
                    secondaryColor: secondaryButtonColor,
                    padding: EdgeInsets.all(15),
                    child: Icon(
                      Icons.settings_rounded,
                      color: iconColor,
                    ),
                  ),
                  Text('Music Player',
                      style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87)),
                  const CustomButton(
                    primaryColor: primarybuttonColor,
                    secondaryColor: secondaryButtonColor,
                    padding: EdgeInsets.all(15),
                    child: Icon(
                      Icons.notifications_active_rounded,
                      color: iconColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
              future: _getSongDetails(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("${snapshot.error}"),
                  );
                } else if (snapshot.hasData) {
                  var items = snapshot.data as List<dynamic>;
                  return Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int i) {
                        //  final players = playerData.allItems[itemIndex];
                        final songs = items[i];
                        return GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AudioPlayerScreen(
                                songDetails: songs,
                              ),
                            ),
                          ),
                          child: SongCard(
                              imageUrl: items[i].imageUrl,
                              songName: items[i].songName,
                              artistName: items[i].artistName,
                              songDuration: items[i].songDuration),
                        );
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}



