import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'bug_squash_game.dart';

void main() {
  runApp(
    GameWidget(game: BugSquashGame())
  );
}

