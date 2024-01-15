
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
        ERadialLight(
            ERelativePos(0.3, 0.1),
            ERelative(100, ERelative.absolute),
            EGradient([
              EColorShift([Color.fromARGB(150, 255, 255, 255)], 0)
            ]),
            0,
            0,
            ERelative(30, ERelative.absolute),
            ERelative(2, ERelative.absolute),
            0.1,
            1),
        ELightBeam(
            ERelativePos(0.5, 0.5),
            EVector2D(1, 0),
            ERelative(0.6, ERelative.widthAndHeightRelative),
            ERelative(10, ERelative.absolute),
            ERelative(0, ERelative.absolute),
            EGradient([
              EColorShift([Color.fromARGB(150, 255, 255, 255)], 0),
            ]),
            1,
            0,
            ERelative(100, ERelative.absolute),
            ERelative(2, ERelative.absolute),
            0.1,
            1,
            name: "Example Beam")
      ],
      darkness: EColorShift([Color.fromARGB(255, 0, 0, 0)], 0),
      afterUpdate: () {
        EEffect effect = scene!.getEffect("Example Beam")!;
        if (effect is ELightBeam) {
          ELightBeam ourLightBeam = effect;
          //equivalent to mousePos - ourLightBeam.direction
          EVector2D newDirection = mousePos.getAdd(ourLightBeam.position
              .getAbsolutePair(Size(scene!.width, scene!.height))
              .getMultiply(-1));
          ourLightBeam.direction = newDirection;
        }
      },
      beforeUpdate: () {},
    );
  }

  EVector2D mousePos = EVector2D(0, 0);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(body: LayoutBuilder(builder: (context, size) {
      scene!.resize(size.biggest.width, size.biggest.height);
      return MouseRegion(
        child: Stack(
          children: [
            Container(
              width: 600,
              height: 100,
              color: Colors.pink,
            ),
            Positioned(
                width: 200,
                height: 200,
                top: 800,
                left: 100,
                child: Container(
                  color: Colors.red,
                )),
            Positioned(
                width: 400,
                height: 400,
                top: 800,
                left: 800,
                child: Container(
                  color: Colors.blue,
                )),
            Positioned(
                width: 300,
                height: 300,
                top: 200,
                left: 1700,
                child: Container(color: Colors.black)),
            Container(
              child: scene,
            )
          ],
        ),
        onHover: (PointerHoverEvent pointerHoverEvent) {
          mousePos = EVector2D(
              pointerHoverEvent.position.dx, pointerHoverEvent.position.dy);
        },
      );
    })));
  }
}