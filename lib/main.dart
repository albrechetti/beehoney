import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GameWidget(game: BeeHoney()));
}

class BeeHoney extends FlameGame {
  Bg bg = Bg();
  Bg bg2 = Bg();
  SpriteComponent bee = SpriteComponent();

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
    super.update(dt);
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

class Bee {}
