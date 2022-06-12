import 'dart:ui' as ui;

import 'package:dart_helpers/dart_helpers.dart';
import 'package:flame/sprite.dart';

Future<ui.Color?> colorFromSprite(Sprite sprite, int x, int y) async {
  final bytes =
      await sprite.image.toByteData(format: ui.ImageByteFormat.rawRgba);
  if (bytes == null) {
    //print("Can't transform image to byte data.");
    return null;
  }

  final width = sprite.srcSize.x.round();
  final height = sprite.srcSize.y.round();
  final countPixels = width * height;
  final offset = x + y * width;
  if (offset >= countPixels) {
    //print('Out of sprite size.');
    return null;
  }

  final colorInt = bytes.colorIntAtByteOffset(offset);

  return ui.Color(colorInt);
}
