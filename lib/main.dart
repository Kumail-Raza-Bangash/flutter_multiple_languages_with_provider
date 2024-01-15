
import 'package:eeffects/eeffects.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  EScene? scene;

  MyApp() {
    scene = EScene(
      width: 0,
      height: 0,
      effects: [
        EFire(
            EGradient([
              EColorShift([Colors.red], 0),
              EColorShift([Colors.orange.shade800], 0),
              EColorShift([Colors.orange.shade600], 0)
            ]),
            EGradient([
              EColorShift([Color.fromARGB(10, 100, 100, 100)], 0)
            ]),
            EGradient([
              EColorShift([Color.fromARGB(20, 140, 100, 60)], 0),
              EColorShift([Color.fromARGB(10, 140, 100, 60)], 0)
            ]),
            1,
            0,
            ERelativePos(0.5, 0.5),
            EVector2D(0, -1),
            ERelative(30, ERelative.absolute),
            ERelative(40, ERelative.absolute),
            ERelative(2, ERelative.absolute),
            ERelative(40, ERelative.absolute),
            ERelative(150, ERelative.absolute),
            ERelative(8, ERelative.absolute)),
      ],
      darkness: EColorShift([Color.fromARGB(255, 0, 0, 0)], 0),
      afterUpdate: () {},
      beforeUpdate: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(body: LayoutBuilder(builder: (context, size) {
      scene!.resize(size.biggest.width, size.biggest.height);
      return Container(
        child: scene,
      );
    })));
  }
}