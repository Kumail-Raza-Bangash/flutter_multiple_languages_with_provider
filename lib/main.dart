
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
        ELightning(
            ERelativePos(0.5, 0),
            0.02,
            ERelative(1, ERelative.absolute),
            ERelative(20, ERelative.absolute),
            ERelative(600, ERelative.absolute),
            50,
            5,
            EColorShift([Color.fromARGB(255, 80, 0, 255)], 0),
            true,
            8,
            1,
            name: "Example Lightning"),
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
      return GestureDetector(
        child: scene,
        onTapDown: (TapDownDetails tapDownDetails) {
          EEffect effect = scene!.getEffect("Example Lightning")!;
          if (effect is ELightning) {
            ELightning ourLightning = effect;
            ourLightning.buildLightningOnNextTickATTarget(ERelativePair(
                ERelative(tapDownDetails.globalPosition.dx, ERelative.absolute),
                ERelative(
                    tapDownDetails.globalPosition.dy, ERelative.absolute)));

            ourLightning.fireLightningIn(1);
          }
        },
      );
    })));
  }
}