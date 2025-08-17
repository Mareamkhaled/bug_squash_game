import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';

class BugSquashGame extends FlameGame{
  @override
  Color backgroundColor() {
  return const Color(0xFFB2DFDB); // 
  }

  @override
  FutureOr<void> onLoad()async {
   final bugSprite = await Sprite.load('bug.png');
   final bugComponent = SpriteComponent(
      sprite: bugSprite,
      anchor: Anchor.center, 
      size: Vector2(100, 150), 
      position: Vector2(100, 300)
    );
    add(bugComponent);
    return super.onLoad();
  }
  
}