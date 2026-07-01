/// Asset path constants for the Yak design system.
abstract final class YakAssets {
  static const String iconsPath =
      'packages/yak_design_lib_flutter/assets/icons';
  static const String imagesPath =
      'packages/yak_design_lib_flutter/assets/images';

  static String icon(String name) => '$iconsPath/$name';
  static String image(String name) => '$imagesPath/$name';
}
