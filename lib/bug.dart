import 'dart:async';
import 'dart:math';

import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/widgets.dart';

class Bug extends SpriteComponent with TapCallbacks {
  late SpriteComponent _squashedBugComponent;
Function()? onTap;

  late MoveEffect _moveEffect;
  @override

  FutureOr<void> onLoad() async {
    //! Load the bug sprite and the squashed bug sprite
    sprite = await Sprite.load('bug.png');
    final squashedBugSprite = await Sprite.load('squashed_bug.png');
    _squashedBugComponent = SpriteComponent(sprite: squashedBugSprite);
    _squashedBugComponent.opacity = 0.0;
    add(_squashedBugComponent);

    //! angle of the bug
    angle = 3 * pi / 2;

    //! move effect
    final destination = Vector2(100, 600);
    final effectController = EffectController(
      startDelay: 2.0,
      duration: 1.0,
      curve: Curves.easeInOut,
    );
    _moveEffect = MoveEffect.to(destination, effectController);
    add(_moveEffect);
    return super.onLoad();
  }

  //!on tap down event
  @override
  void onTapDown(TapDownEvent event) {
     if (!_moveEffect.isPaused) {
      _moveEffect.pause();
    }
    FlameAudio.play('squash.mp3');
    _squashedBugComponent.opacity = 1.0;
    onTap?.call();
  }
}
