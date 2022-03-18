import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neumorphic_musicplayer_ui/screen/songs_list_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SongsList(),
      ),
      theme: ThemeData(
        // Changing global text theme to poppins
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
    );
  }
}
