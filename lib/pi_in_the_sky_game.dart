import 'package:flame/game.dart';
import 'package:pi_in_the_sky/background.dart';
import 'package:pi_in_the_sky/next_pie_value.dart';
import 'package:pi_in_the_sky/pie.dart';
import 'package:pi_in_the_sky/plate.dart';
import 'package:pi_in_the_sky/score.dart';

class PiInTheSkyGame extends FlameGame with HasDraggables, HasCollisionDetection {
  PiInTheSkyGame();

  late Score score;
  late NextPieValue nextPieValue;
  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      score = Score(),
      nextPieValue = NextPieValue(),
      for(int i = 0; i <= 10; i++)
        Pie(score: score, nextPieValue: nextPieValue),
      Plate(),
    ]);
  }
}