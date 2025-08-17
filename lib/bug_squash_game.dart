import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';

import 'bug.dart';

class BugSquashGame extends FlameGame{

 late Timer _interval;

  BugSquashGame() {
    _interval = Timer(1.0, onTick: _createBug, repeat: true);
  }

  @override
  void update(double dt) {
    _interval.update(dt);
    super.update(dt);
  }

  @override
  Color backgroundColor() {
  return const Color.fromARGB(255, 111, 167, 163); // 
  }

  // @override
  // FutureOr<void> onLoad()async {
  //  final bugComponent = _createBug();
   
  //   return super.onLoad();
  // }

 void _createBug() {
    final bugComponent = Bug();
    final gameHeight = size.y;
    final randomYPosition = Random().nextDouble() * gameHeight;
    bugComponent.anchor = Anchor.center;
    bugComponent.position = Vector2(0, randomYPosition);
    bugComponent.angle = pi / 2;
    bugComponent.onTap = () {
      Future.delayed(const Duration(milliseconds: 500)).then(
        (value) {
          if (!bugComponent.isRemoved) {
            remove(bugComponent);
          }
        },
      );
    };
    add(bugComponent);
  }
  
}