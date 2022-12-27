import 'package:flutter/material.dart';
import 'package:movies_app/movies_modules/presentation/animations/animation_route.dart';

void navigateTo(context, widget) => Navigator.push(
  context,
  SliderRight(page: widget,rotate: 4),
);