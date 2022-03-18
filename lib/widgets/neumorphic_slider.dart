import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CustomNeumorphicSlider extends StatelessWidget {
  const CustomNeumorphicSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicSlider(
      value: 40,
      min: 0,
      max: 100,
      height: 10,
      style: const SliderStyle(
        accent: Colors.redAccent,
        variant: Colors.red,
      ),
      thumb: Container(
        height: 20,
        width: 20,
        decoration: const BoxDecoration(
            color: Colors.deepOrange, shape: BoxShape.circle),
      ),
    );
  }
}
