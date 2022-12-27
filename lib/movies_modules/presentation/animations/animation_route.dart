// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class SliderRight extends PageRouteBuilder {
  final page;
  final rotate;

  SliderRight({this.page, this.rotate})
      : super(
            pageBuilder: (context, animation, animationTwo) => page,
            transitionsBuilder: (
              context,
              animation,
              animationTwo,
              child,
            ) {
              if (rotate == 1) {
                var begin = const Offset(1.0, 0.0);
                var end = Offset.zero;
                var tween = Tween(begin: begin, end: end);
                var offsetAnimation = animation.drive(tween);
                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              } else if (rotate == 2) {
                var begin = 0.0;
                var end = 1.0;
                var tween = Tween(begin: begin, end: end);
                var curvesAnimation =
                    CurvedAnimation(parent: animation, curve: Curves.linear);
                return RotationTransition(
                  turns: tween.animate(curvesAnimation),
                  child: child,
                );
              } else if (rotate == 3) {
                return Align(
                  alignment: Alignment.center,
                  child: SizeTransition(
                    sizeFactor: animation,
                    child: child,
                  ),
                );
              } else if (rotate == 4) {
                var begin = 1.0;
                var end = 0.0;
                var tween = Tween(begin: begin, end: end);
                var offsetAnimation = animation.drive(tween);
                return ScaleTransition(
                  scale: tween.animate(offsetAnimation),
                  child: RotationTransition(
                      turns: tween.animate(offsetAnimation), child: child),
                );
              } else {
                var begin = 1.0;
                var end = 0.0;
                var tween = Tween(begin: begin, end: end);
                var offsetAnimation = animation.drive(tween);
                return ScaleTransition(
                  scale: tween.animate(offsetAnimation),
                  child: child,
                );
              }
            });
}
