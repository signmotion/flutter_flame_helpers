import 'package:flame/components.dart';
import 'package:json_annotation/json_annotation.dart';

import '../extensions/anchor_extension.dart';

class AnchorJsonConverter implements JsonConverter<Anchor, String?> {
  static const defaultAnchor = Anchor.topLeft;

  const AnchorJsonConverter();

  @override
  Anchor fromJson(String? s) =>
      (s != null && s.isAnchor) ? s.buildAnchor : defaultAnchor;

  @override
  String toJson(Anchor o) => o.s;
}
