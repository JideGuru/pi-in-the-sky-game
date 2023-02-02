import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/flame.dart';
import 'package:pi_in_the_sky/pi_in_the_sky_game.dart';

class Plate extends PositionComponent with HasGameRef<PiInTheSkyGame>, Draggable {
  Plate();

  @override
  Future<void> onLoad() async {
    final image = await Flame.images.load('Plate.png');
    size = Vector2(80, 15);
    position = Vector2(gameRef.size.x / 2 - size.x / 2, gameRef.size.y * 0.95);
    addAll([
      SpriteComponent(sprite: Sprite(image), size: size),
      RectangleHitbox(),
    ]);
  }

  @override
  bool onDragStart(DragStartInfo info) {
    position.x = info.eventPosition.game.x - size.x / 2;
    return super.onDragStart(info);
  }

  @override
  bool onDragUpdate(DragUpdateInfo info) {
    position.x = info.eventPosition.game.x - size.x / 2;
    return super.onDragUpdate(info);
  }
}
