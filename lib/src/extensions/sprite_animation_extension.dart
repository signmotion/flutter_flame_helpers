import 'package:flame/cache.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';

extension SpriteAnimationExtension on SpriteAnimation {
  static Future<SpriteAnimation> fromFolderWithAtlas(
    String assetsFolder,
    String pathAtlas,
    String pathData,
  ) async {
    /// Access a shared instance of the [Images] class with redefined prefix path.
    final flameImages = Images(prefix: '$assetsFolder/');
    final image = await flameImages.load(pathAtlas);
    final data = await Flame.assets.readJson(pathData);

    return SpriteAnimation.fromAsepriteData(image, data);
  }
}
