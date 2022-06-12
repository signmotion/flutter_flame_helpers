import 'package:vector_math/vector_math_64.dart';

import 'anchor_extension.dart';

// \see StringSizeExtension
extension Vector2PositionExtension on String {
  //Vector2 get toVector2 => toVector2DependsOfSize(Vector2(1, 1));

  /// Examples:
  ///   "4096 3072"
  ///   "4096, 3072"
  ///   "4096 x 3072"
  ///   "4096x3072"
  ///   "4096 X 3072"
  ///   "4096X3072"
  Vector2 toVector2DependsOfSize(Vector2 pictureSize) {
    final s = trim();
    if (s.isEmpty) {
      return Vector2.zero();
    }

    final l = s.split(RegExp('[ ,xX]+'));
    if (l.length == 1) {
      final a = l.first;
      assert(a.isAnchor,
          'Expected anchor, space separated numeric values or empty string.');
      assert(pictureSize.x > 0 && pictureSize.y > 0,
          'Attempt calculate a vector $s with zero picture size.');
      return pictureSize..multiply(a.buildAnchor.toVector2());
    }

    assert(
        l.length == 2,
        'String should be contains the numeric values'
        ' separated the spaces.'
        ' Has: `$l`');

    final sx = l[0];
    var x = double.tryParse(sx);
    if (x == null) {
      if (sx == 'left') {
        x = 0;
      } else if (sx == 'right') {
        x = pictureSize.x;
      } else if (sx == 'center') {
        x = pictureSize.x / 2;
      }
    }
    assert(x != null, "Can't parse X from `$sx`");

    final sy = l[1];
    var y = double.tryParse(sy);
    if (y == null) {
      if (sy == 'top') {
        y = 0;
      } else if (sy == 'bottom') {
        y = pictureSize.y;
      } else if (sy == 'center') {
        y = pictureSize.y / 2;
      }
    }
    assert(y != null, "Can't parse Y from `$sy`");

    return Vector2(x ?? 0, y ?? 0);
  }
}
