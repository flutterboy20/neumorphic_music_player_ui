import 'package:flutter/material.dart';
import 'package:neumorphic_musicplayer_ui/model/song_details.dart';
import 'package:neumorphic_musicplayer_ui/widgets/neumorphic_button.dart';
import 'package:neumorphic_musicplayer_ui/widgets/neumorphic_image.dart';
import 'package:neumorphic_musicplayer_ui/widgets/neumorphic_slider.dart';
import 'package:neumorphic_musicplayer_ui/widgets/song_name.dart';

import '../colors.dart';

class AudioPlayerScreen extends StatefulWidget {
  static const routeName = 'audio-player-screen';
  final SongDetails songDetails;
  AudioPlayerScreen({Key? key, required this.songDetails}) : super(key: key);

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen>
    with TickerProviderStateMixin {


  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 5),
    vsync: this,
  )..repeat(reverse: false);

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool isStopped = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          // Wrap this column with singlechildscrollview if you face overflow issue
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomButton(
                        primaryColor: primarybuttonColor,
                        secondaryColor: secondaryButtonColor,
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: const Icon(
                            Icons.arrow_back,
                            color: iconColor,
                          ),
                        ),
                      ),
                      const Text(
                        'Now Playing',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: iconColor),
                      ),
                      const CustomButton(
                        primaryColor: primarybuttonColor,
                        secondaryColor: secondaryButtonColor,
                        child: Icon(
                          Icons.menu_rounded,
                          color: iconColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                RotationTransition(
                  turns: _animation,
                  child: CustomNeumorphicImage(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        widget.songDetails.imageUrl,
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SongName(widget: widget),
              ],
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Text(
                            "2:12",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: iconColor,
                            ),
                          ),
                          Text(
                            widget.songDetails.songDuration,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: iconColor,
                            ),
                          ),
                        ],
                      ),
                      const CustomNeumorphicSlider(),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const CustomButton(
                        primaryColor: primarybuttonColor,
                        secondaryColor: secondaryButtonColor,
                        padding: EdgeInsets.all(24),
                        child: Icon(
                          Icons.fast_rewind_rounded,
                          color: iconColor,
                        ),
                      ),
                      CustomButton(
                        primaryColor: primaryActiveButtonColor,
                        secondaryColor: secondaryActiveButtonColor,
                        padding: const EdgeInsets.all(24),
                        child: GestureDetector(
                          onTap: () {
                            if (_controller.isAnimating) {
                              _controller.stop(); // Stop the animation
                              setState(() {
                                isStopped = !isStopped;
                              });
                            } else {
                              _controller.repeat(); // Start the animation
                              setState(() {
                                isStopped = !isStopped;
                              });
                            }
                          },
                          child: isStopped
                              ? const Icon(
                                  Icons.play_arrow_rounded,
                                  color: Colors.black87,
                                )
                              : const Icon(
                                  Icons.pause,
                                  color: Colors.black87,
                                ),
                        ),
                      ),
                      const CustomButton(
                        primaryColor: primarybuttonColor,
                        secondaryColor: secondaryButtonColor,
                        padding: EdgeInsets.all(24),
                        child: Icon(
                          Icons.fast_forward,
                          color: iconColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

