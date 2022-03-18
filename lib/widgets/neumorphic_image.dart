import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CustomNeumorphicImage extends StatelessWidget {
   CustomNeumorphicImage({Key? key,required this.child}) : super(key: key);

  Widget child;

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(42),
      style: const NeumorphicStyle(
        depth: 32,
        intensity: 0.8,
        shape: NeumorphicShape.flat,
        boxShape: NeumorphicBoxShape.circle(),
      ),
      child: child,
    );
  }
}
