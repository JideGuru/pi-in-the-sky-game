import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:pi_in_the_sky/pi_in_the_sky_game.dart';

class Background extends SpriteComponent with HasGameRef<PiInTheSkyGame> {
  Background();

  @override
  Future<void> onLoad() async {
    final image = await Flame.images.load('Sky.png');
    size = gameRef.size;
    sprite = Sprite(image);
  }
}