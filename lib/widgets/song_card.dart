import 'package:flutter/material.dart';
import 'package:neumorphic_musicplayer_ui/widgets/neumorphic_button.dart';
import '../colors.dart';

class SongCard extends StatelessWidget {
  SongCard({
    required this.imageUrl,
    required this.songName,
    required this.artistName,
    required this.songDuration,
    Key? key,
  }) : super(key: key);

  String imageUrl;
  String songName;
  String artistName;
  String songDuration;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              CustomButton(
                primaryColor: primarybuttonColor,
                secondaryColor: secondaryButtonColor,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    imageUrl,
                    height: 40,
                    width: 40,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                margin: const EdgeInsets.only(top: 18, left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      songName,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: iconColor),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      artistName,
                      style: const TextStyle(fontSize: 14, color: iconColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(songDuration,
                  style: const TextStyle(fontSize: 14, color: iconColor)),
              const SizedBox(
                width: 14,
              ),
              const CustomButton(
                primaryColor: primarybuttonColor,
                secondaryColor: secondaryButtonColor,
                padding: EdgeInsets.all(4),
                child: Icon(
                  Icons.play_arrow,
                  color: iconColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
