import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';

import 'bug.dart';

class BugSquashGame extends FlameGame {
  late TextComponent _scoreComponent;
  int _score = 0;
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

  @override
  FutureOr<void> onLoad() {
    _scoreComponent = TextComponent(
      text: "$_score",
      textRenderer: TextPaint(
        style: const TextStyle(color: Colors.black, fontSize: 24.0),
      ),
    );
    _scoreComponent.anchor = Anchor.center;
    _scoreComponent.position = Vector2(size.x / 2, 100);
    add(_scoreComponent);
  }

  void _createBug() {
    final bugComponent = Bug();
    final gameHeight = size.y;
    final randomYPosition = Random().nextDouble() * gameHeight;
    bugComponent.anchor = Anchor.center;
    bugComponent.position = Vector2(0, randomYPosition);
    bugComponent.angle = pi / 2;
    bugComponent.onTap = () {
      _scoreComponent.text = "${_score += 1}";
      Future.delayed(const Duration(milliseconds: 500)).then((value) {
        if (!bugComponent.isRemoved) {
          remove(bugComponent);
        }
      });
    };
    add(bugComponent);
  }
}
