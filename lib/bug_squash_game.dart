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
    // print('Bug position: ${bugComponent.position}');
    bugComponent.anchor = Anchor.center;  
    bugComponent.onTap = (){
       Future.delayed(const Duration(milliseconds: 500)).then(
        (value) {
          if (!bugComponent.isRemoved) {
            remove(bugComponent);
          }
        },
      );
      
    };
    add(bugComponent);
    return super.onLoad();
  }
  
}