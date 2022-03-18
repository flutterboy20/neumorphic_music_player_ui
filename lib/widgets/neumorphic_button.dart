import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.child,
      this.padding = const EdgeInsets.all(10),
      required this.primaryColor,
      required this.secondaryColor})
      : super(key: key);

  final Widget child;
  final EdgeInsets padding;
  final Color primaryColor;
  final Color secondaryColor;

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      padding: const EdgeInsets.all(2),
      style: NeumorphicStyle(
        color: secondaryColor,
        depth: 10,
        intensity: 0.8,
        shape: NeumorphicShape.flat,
        boxShape: const NeumorphicBoxShape.circle(),
      ),
      child: NeumorphicButton(
        minDistance: -10,
        padding: padding,
        style: NeumorphicStyle(
          color: primaryColor,
          depth: 10,
          intensity: 0.8,
          shape: NeumorphicShape.convex,
          boxShape: const NeumorphicBoxShape.circle(),
        ),
        child: child,
      ),
    );
  }
}
