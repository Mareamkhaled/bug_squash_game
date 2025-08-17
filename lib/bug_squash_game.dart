import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';

import 'bug.dart';

class BugSquashGame extends FlameGame{
  @override
  Color backgroundColor() {
  return const Color.fromARGB(255, 111, 167, 163); // 
  }

  @override
  FutureOr<void> onLoad()async {
   final bugComponent = Bug();
    bugComponent.position = Vector2(size.x / 2, size.y / 2);
    bugComponent.anchor = Anchor.center;  
    add(bugComponent);
    return super.onLoad();
  }
  
}