import 'package:barb/core/utils/exports.dart';

class PreloadImageUtil {
  PreloadImageUtil._();

  static Future<void> loadCacheImages() async {
    final imageDecoder = SvgPicture.svgStringDecoder;
    Future.wait([
      precachePicture(
        ExactAssetPicture(imageDecoder, 'onboarding1'.svg),
        null,
      ),
      precachePicture(
        ExactAssetPicture(imageDecoder, 'onboarding2'.svg),
        null,
      ),
      precachePicture(
        ExactAssetPicture(imageDecoder, 'setup'.svg),
        null,
      ),
      precachePicture(
        ExactAssetPicture(imageDecoder, 'payment'.svg),
        null,
      ),
      precachePicture(
        ExactAssetPicture(imageDecoder, 'empty_card'.svg),
        null,
      ),
      precachePicture(
        ExactAssetPicture(imageDecoder, 'coming_soon1'.svg),
        null,
      ),
      precachePicture(
        ExactAssetPicture(imageDecoder, 'coming_soon2'.svg),
        null,
      ),
      // other SVGs or images here
    ]);
  }
}