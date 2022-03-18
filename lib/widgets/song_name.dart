import 'package:flutter/material.dart';
import 'package:neumorphic_musicplayer_ui/screen/audio_player_screen.dart';
import '../colors.dart';

// Song Name Widget
class SongName extends StatelessWidget {
  const SongName({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final AudioPlayerScreen widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          widget.songDetails.songName,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black45,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          widget.songDetails.artistName,
          style: const TextStyle(
            fontSize: 18,
            color: iconColor,
          ),
        ),
      ],
    );
  }
}
