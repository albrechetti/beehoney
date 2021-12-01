import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(GameWidget(
    game: BeeHoney(),
  ));
}

class BeeHoney extends FlameGame with KeyboardEvents {
  Bg bg = Bg();
  Bg bg2 = Bg();
  Bee bee = Bee();

  @override
  Future<void>? onLoad() async {
    bg
      ..sprite = await Sprite.load('bg.png')
      ..size.x = 500
      ..size.y = 900
      ..position = Vector2(0, 0);
    add(bg);
    bg2
      ..sprite = await Sprite.load('bg.png')
      ..size.x = 500
      ..size.y = 900
      ..position = Vector2(0, -900);
    add(bg2);

    bee
      ..sprite = await Sprite.load('bee1.png')
      ..size = Vector2.all(50)
      ..position = Vector2(250, 800)
      ..anchor = Anchor.center;
    add(bee);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    bg.move(dt, 200, 900, 0);
    bg2.move(dt, 200, 0, -900);
    bee.move(dt, 100);
    bee.spriteAnimation();
    super.update(dt);
  }

  @override
  KeyEventResult onKeyEvent(
      RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
      bee.isMovingLeft = true;
    } else {
      bee.isMovingLeft = false;
    }
    if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
      bee.isMovingRight = true;
    } else {
      bee.isMovingRight = false;
    }

    return super.onKeyEvent(event, keysPressed);
  }
}

class Bg extends SpriteComponent {
  move(dt, speed, limit, posY) {
    y += speed * dt;
    if (position.y >= limit) {
      y = posY;
    }
  }
}

class Bg2 extends SpriteComponent {
  move(dt, speed, limit, posY) {
    y += speed * dt;
    if (position.y >= limit) {
      y = posY;
    }
  }
}

class Bee extends SpriteComponent {
  bool isMovingLeft = false;
  bool isMovingRight = false;
  int timer = 0;
  int image = 1;

  move(dt, speed) {
    if (isMovingLeft) {
      if (x >= 25) {
        x -= speed * dt;
      }
    }
    if (isMovingRight) {
      if (x <= 475) {
        x += speed * dt;
      }
    }
  }

  spriteAnimation() async {
    timer += 1;
    if (timer >= 6) {
      timer = 0;
      image += 1;
    }
    if (image > 4) {
      image = 1;
    }
    sprite = await Sprite.load('bee$image.png');
  }
}


class Character extends SpriteComponent {
 
}
