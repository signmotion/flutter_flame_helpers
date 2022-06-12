import 'dart:ui' as ui;

import 'package:dart_helpers/dart_helpers.dart';
import 'package:flame/components.dart';
import 'package:flutter/foundation.dart';

// ignore: comment_references
/// \see mixin [OpaqueSpriteWelement]
extension SpriteTransparentExtension on Sprite {
  /// \param lowLimitColorAlpha Define tapping when a transparent into a sprite above this value.
  Future<bool> isTransparentPixel(
    Vector2 pos, {
    double scale = 1.0,
    int lowLimitColorAlpha = 0x30,
    String spriteName = '',
  }) async {
    assert(scale > 0);

    final scaledX = (pos.x / scale).round();
    final scaledY = (pos.y / scale).round();
    final bytes = await image.toByteData(format: ui.ImageByteFormat.rawRgba);
    final width = srcSize.x.round();
    final height = srcSize.y.round();
    final byteOffset = 4 * (scaledX + (scaledY * width));
    if (byteOffset >= 4 * width * height || byteOffset < 0) {
      throw Exception(
          '$pos are out of range for sprite `$spriteName` $srcSize');
    }

    final color = bytes!.colorIntAtByteOffset(byteOffset);
    final alpha = color.colorIntAlpha;
    if (kDebugMode) {
      print('${alpha < lowLimitColorAlpha} for sprite `$spriteName`'
          ' because alpha $alpha < lowLimitColorAlpha $lowLimitColorAlpha');
    }

    return alpha < lowLimitColorAlpha;
  }
}
