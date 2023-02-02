import 'dart:math' as math;

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:pi_in_the_sky/pi_in_the_sky_game.dart';

class Score extends TextComponent with HasGameRef<PiInTheSkyGame> {
  Score();

  late int score;

  @override
  Future<void>? onLoad() async {
    score = 0;
    position = Vector2.all(15);
    text = math.pi.toString();

    return super.onLoad();
  }


  @override
  void update(double dt) {
    super.update(dt);
    text = math.pi.toString().substring(0, 2 + score);
  }

  @override
  void render(Canvas canvas) {
    TextPaint(
      style: TextStyle(
        fontSize: 40.0,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
    ).render(canvas, text, Vector2.zero());
  }
}
