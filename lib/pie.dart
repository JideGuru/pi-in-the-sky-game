import 'dart:math';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:pi_in_the_sky/next_pie_value.dart';
import 'package:pi_in_the_sky/pi_in_the_sky_game.dart';
import 'package:pi_in_the_sky/plate.dart';
import 'package:pi_in_the_sky/score.dart';

class Pie extends SpriteComponent
    with HasGameRef<PiInTheSkyGame>, CollisionCallbacks {
  late final Score _score;
  late final NextPieValue _nextPieValue;

  Pie({required Score score, required NextPieValue nextPieValue})
      : _score = score,
        _nextPieValue = nextPieValue;

  final Random _random = Random();
  late int pieNumber;
  late Image image;
  late double velocity;

  final List _colors = ['Blue', 'Orange', 'Pink', 'Yellow'];

  @override
  Future<void> onLoad() async {
    resetPie();
    image = await Flame.images.load('Pies/Pie_Blue-08.png');
    size = Vector2(70, 70);
    sprite = Sprite(image);
    add(CircleHitbox(radius: 35));
  }


  @override
  void update(double dt) {
    super.update(dt);
    position.y += velocity * dt;
    if (position.y >= gameRef.size.y + size.y) {
      resetPie();
    }
  }

  resetPie() async {
    position.x = _random.nextDouble() * gameRef.size.x - size.x;
    position.y = _random.nextDouble() * -500;
    pieNumber = _random.nextInt(10);
    velocity = 150 + _random.nextDouble() * 250;
    String color = _colors[_random.nextInt(4)];
    image = image = await Flame.images.load('Pies/Pie_$color-0$pieNumber.png');
    sprite = Sprite(image);
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints,
      PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is Plate) {
      if (_nextPieValue.nextValue == pieNumber) {
        _score.score += 1;
        _nextPieValue.score += 1;
        resetPie();
      } else {
        gameRef.pauseEngine();
      }
    }
  }
}