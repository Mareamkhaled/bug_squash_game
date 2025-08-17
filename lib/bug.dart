import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';

class Bug  extends SpriteComponent with TapCallbacks {
  late SpriteComponent _squashedBugComponent;

  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load('bug.png');
    final squashedBugSprite = await Sprite.load('squashed_bug.png');
    _squashedBugComponent = SpriteComponent(
      sprite: squashedBugSprite,
    );
    _squashedBugComponent.opacity = 0.0; 
    add(_squashedBugComponent);
    return super.onLoad();
  }

  @override
  void onTapDown(TapDownEvent event) {
    FlameAudio.play('squash.mp3');
    _squashedBugComponent.opacity = 1.0;
    super.onTapDown(event);
  }
}