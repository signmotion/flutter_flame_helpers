import 'package:collection/collection.dart' show IterableExtension;
import 'package:flame/components.dart';

import '../../flutter_flame_helpers.dart';

extension AnchorExtension on Anchor {
  static final anchorList = <String, Vector2>{
    'topLeft': Anchor.topLeft.toVector2(),
    'top left': Anchor.topLeft.toVector2(),
    'leftTop': Anchor.topLeft.toVector2(),
    'left top': Anchor.topLeft.toVector2(),
    'topCenter': Anchor.topCenter.toVector2(),
    'top center': Anchor.topCenter.toVector2(),
    'centerTop': Anchor.topCenter.toVector2(),
    'center top': Anchor.topCenter.toVector2(),
    'topRight': Anchor.topRight.toVector2(),
    'top right': Anchor.topRight.toVector2(),
    'rightTop': Anchor.topRight.toVector2(),
    'right top': Anchor.topRight.toVector2(),
    'centerLeft': Anchor.centerLeft.toVector2(),
    'center left': Anchor.centerLeft.toVector2(),
    'leftCenter': Anchor.centerLeft.toVector2(),
    'left center': Anchor.centerLeft.toVector2(),
    '': AnchorJsonConverter.defaultAnchor.toVector2(),
    'center': Anchor.center.toVector2(),
    'center center': Anchor.center.toVector2(),
    'centerRight': Anchor.centerRight.toVector2(),
    'center right': Anchor.centerRight.toVector2(),
    'rightCenter': Anchor.centerRight.toVector2(),
    'right center': Anchor.centerRight.toVector2(),
    'bottomLeft': Anchor.bottomLeft.toVector2(),
    'bottom left': Anchor.bottomLeft.toVector2(),
    'leftBottom': Anchor.bottomLeft.toVector2(),
    'left bottom': Anchor.bottomLeft.toVector2(),
    'bottomCenter': Anchor.bottomCenter.toVector2(),
    'bottom center': Anchor.bottomCenter.toVector2(),
    'centerBottom': Anchor.bottomCenter.toVector2(),
    'center bottom': Anchor.bottomCenter.toVector2(),
    'bottomRight': Anchor.bottomRight.toVector2(),
    'bottom right': Anchor.bottomRight.toVector2(),
    'rightBottom': Anchor.bottomRight.toVector2(),
    'right bottom': Anchor.bottomRight.toVector2(),
  };

  bool get byLeft =>
      this == Anchor.topLeft ||
      this == Anchor.bottomLeft ||
      this == Anchor.centerLeft;

  bool get byTop =>
      this == Anchor.topLeft ||
      this == Anchor.topRight ||
      this == Anchor.topCenter;

  bool get byRight =>
      this == Anchor.topRight ||
      this == Anchor.bottomRight ||
      this == Anchor.centerRight;

  bool get byBottom =>
      this == Anchor.bottomLeft ||
      this == Anchor.bottomRight ||
      this == Anchor.bottomCenter;

  bool get byCenter =>
      this == Anchor.center ||
      this == Anchor.centerLeft ||
      this == Anchor.centerRight ||
      this == Anchor.topCenter ||
      this == Anchor.bottomCenter;

  String get s =>
      anchorList.keys.firstWhereOrNull(
        (key) => anchorList[key] == toVector2(),
      ) ??
      'center';
}

extension AnchorBuildStringExtension on String {
  Anchor get buildAnchor => Anchor(
        AnchorExtension.anchorList[this]!.x,
        AnchorExtension.anchorList[this]!.y,
      );

  bool get isAnchor => AnchorExtension.anchorList.keys.contains(this);
}
