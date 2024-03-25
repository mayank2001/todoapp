import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  //it is a private constructor
  const AppTheme._();

  static final light = FlexThemeData.light(
      scheme: FlexScheme.deepBlue,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog,
      blendLevel: 40,
      appBarStyle: FlexAppBarStyle.primary,
      appBarOpacity: 0.95,
      appBarElevation: 0,
      transparentStatusBar: true,
      tabBarStyle: FlexTabBarStyle.forBackground,
      tooltipsMatchBackground: true,
      swapColors: true,
      lightIsWhite: true,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      fontFamily: GoogleFonts.abhayaLibre().fontFamily,
      subThemesData: const FlexSubThemesData(
        useTextTheme: true,
        fabUseShape: true,
        interactionEffects: true,
        bottomNavigationBarElevation: 0,
        bottomNavigationBarOpacity: 1,
        navigationBarOpacity: 1,
        navigationBarMutedUnselectedIcon: true,
        inputDecoratorIsFilled: true,
        inputDecoratorBorderType: FlexInputBorderType.outline,
        inputDecoratorUnfocusedHasBorder: true,
        blendOnColors: true,
        blendTextTheme: true,
        popupMenuElevation: 0.95,
      ));
}
