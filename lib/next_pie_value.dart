import 'dart:math' as math;

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:pi_in_the_sky/pi_in_the_sky_game.dart';

class NextPieValue extends TextComponent with HasGameRef<PiInTheSkyGame> {
  NextPieValue();

  late int score;
  late int nextValue;

  @override
  Future<void>? onLoad() async {
    score = 0;
    position = Vector2(gameRef.size.x - 60, 15);
    text = math.pi.toString().substring(2 + score, 4 + score);
    nextValue = int.parse(text.substring(0, 1));
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    text = math.pi.toString().substring(2 + score, 4 + score);
    nextValue = int.parse(text.substring(0, 1));
  }

  @override
  void render(Canvas canvas) {
    TextPaint(
      style: TextStyle(
        fontSize: 40.0,
        color: Colors.green[700],
        fontWeight: FontWeight.w600,
      ),
    ).render(canvas, text, Vector2.zero());
  }
}
