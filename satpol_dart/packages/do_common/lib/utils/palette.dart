import 'package:flutter/material.dart';

class Palette {
  Palette._();

  static const Color nearlyWhite = Color(0xFFFAFAFA);
  static const Color white = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFF2F3F8);
  static const Color nearlyDarkBlue = Color(0xFF2633C5);

  static const Color nearlyBlue = Color(0xFF00B6F0);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color greyDefault = Color(0xFF3A5160);
  static const Color darkGreyDefault = Color(0xFF313A44);

  static const Color darkTextDefault = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightTextDefault = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color spacer = Color(0xFFF2F2F2);
  static const TextTheme textTheme = TextTheme(
    headline1: headline1,
    headline4: headline4,
    headline5: headline5,
    headline6: headline6,
    subtitle1: subtitle1,
    subtitle2: subtitle2,
    bodyText1: body1,
    bodyText2: body2,
    caption: caption,
  );

  static const Color colorTheme = Color(0xFF3366FF);

  static const Color lightColor = Color(0xFFFFFFFF);
  static const Color backgroundLightColor = Color(0xFFEDF1F7);
  static const Color darkColor = Color(0xFF0d1117);
  static const Color menuIconColor = Color(0xFF8F9BB3);

  static const String fontName = 'OpenSans';
  static const Color greyText = Color(0xFF9E9E9E);
  static const Color darkText = Color(0xFF17262A);
  static const Color lightText = Color(0xFFFFFFFF);
  static const Color lightModal = Color(0xFFFFFFFF);
  static const Color buttonDisable = Color.fromRGBO(143, 155, 179, .24);
  static const Color buttonTextDisable = Color.fromRGBO(143, 155, 179, .48);
  static const Color danger = Color(0xFFFF0000);
  static const Color lightDanger = Color(0xFFEF5350);

  static const Color darkDeep = Color(0xFF000000);
  static const Color darkAccent = Color(0xFF1a1a1b);
  static const Color lightGrey = Color(0xFFE0E0E0);
  static const Color grey = Color(0xFF9E9E9E);
  static const Color darkGrey = Color(0xFF757575);
  static const Color lightBlueGrey = Color(0xFFF2F3F8);
  static const Color darkBlueGrey = Color(0xFF3A5160);

  static final ThemeData light = ThemeData(
    platform: TargetPlatform.iOS,
    primaryColor: colorTheme,
    backgroundColor: backgroundLightColor,
    splashColor: lightColor,
    appBarTheme: const AppBarTheme(
      color: lightColor,
      titleTextStyle: titleTextStyle,
      shadowColor: darkGrey,
      iconTheme: IconThemeData(color: darkColor),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: lightColor,
      selectedIconTheme: IconThemeData(
        color: colorTheme,
      ),
      unselectedIconTheme: IconThemeData(
        color: menuIconColor,
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: lightModal,
    ),
    dialogTheme: const DialogTheme(backgroundColor: lightColor),
    dividerTheme: DividerThemeData(
      color: darkColor.withOpacity(0.1),
      thickness: 1.0,
      indent: 65,
      endIndent: 10,
    ),
    colorScheme: ColorScheme.light(
      primary: darkColor.withOpacity(0.5),
      onPrimary: lightColor,
      secondary: colorTheme,
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
        color: darkColor.withOpacity(0.5),
      ),
      hintStyle: TextStyle(
        color: darkColor.withOpacity(0.5),
      ),
      errorStyle: const TextStyle(
        color: danger,
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: const BorderSide(
          color: danger,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: darkColor.withOpacity(0.5),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: const BorderSide(
          color: colorTheme,
        ),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: lightColor,
      backgroundColor: colorTheme,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: colorTheme,
      disabledColor: buttonDisable,
      highlightColor: Colors.transparent,
      minWidth: 200.0,
      height: 48.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    ),
    toggleButtonsTheme: const ToggleButtonsThemeData(selectedColor: colorTheme),
    cardTheme: const CardTheme(
      color: lightColor,
      shadowColor: darkGrey,
    ),
    iconTheme: const IconThemeData(
      color: darkColor,
    ),
    primaryIconTheme: const IconThemeData(
      color: darkColor,
    ),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: colorTheme),
    textTheme: const TextTheme(
      headline1: headline1,
      headline4: headline4,
      headline5: headline5,
      headline6: headline6,
      subtitle1: subtitle1,
      subtitle2: subtitle2,
      bodyText1: body1,
      bodyText2: body2,
      caption: caption,
    ),
  );

  static final ThemeData dark = ThemeData(
    platform: TargetPlatform.iOS,
    primaryColor: colorTheme,
    scaffoldBackgroundColor: darkColor,
    backgroundColor: darkColor,
    splashColor: darkColor,
    appBarTheme: const AppBarTheme(
      color: darkColor,
      titleTextStyle: titleTextStyleDark,
      shadowColor: darkGrey,
      iconTheme: IconThemeData(color: lightColor),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: darkDeep,
      selectedIconTheme: const IconThemeData(
        color: lightColor,
      ),
      unselectedIconTheme: IconThemeData(
        color: lightColor.withOpacity(0.7),
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: darkAccent,
    ),
    dialogTheme: const DialogTheme(backgroundColor: darkAccent),
    dividerTheme: DividerThemeData(
      color: lightColor.withOpacity(0.1),
      thickness: 1.0,
      indent: 65,
      endIndent: 10,
    ),
    colorScheme: const ColorScheme.dark(
      primary: lightColor,
      onPrimary: darkColor,
      secondary: colorTheme,
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
        color: lightColor.withOpacity(0.3),
      ),
      hintStyle: TextStyle(
        color: lightColor.withOpacity(0.3),
      ),
      errorStyle: const TextStyle(
        color: danger,
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: const BorderSide(
          color: danger,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: BorderSide(
          color: lightColor.withOpacity(0.5),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0),
        borderSide: const BorderSide(
          color: colorTheme,
        ),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: darkColor,
      backgroundColor: colorTheme,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: colorTheme,
      disabledColor: buttonDisable,
      highlightColor: Colors.transparent,
      minWidth: 200.0,
      height: 48.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
    ),
    toggleButtonsTheme: const ToggleButtonsThemeData(selectedColor: colorTheme),
    cardTheme: const CardTheme(
      color: darkColor,
      shadowColor: lightColor,
    ),
    iconTheme: const IconThemeData(
      color: lightColor,
    ),
    primaryIconTheme: const IconThemeData(
      color: lightColor,
    ),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: colorTheme),
    textTheme: const TextTheme(
      headline1: headline1Dark,
      headline4: headline4Dark,
      headline5: headline5Dark,
      headline6: headline6Dark,
      subtitle1: subtitle1Dark,
      subtitle2: subtitle2Dark,
      bodyText1: body1Dark,
      bodyText2: body2Dark,
      caption: captionDark,
    ),
  );

  // Light Text

  static const TextStyle titleTextStyle = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w700,
    fontSize: 22,
    letterSpacing: 1.2,
    color: darkText,
  );

  static const TextStyle headline1 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w700,
    fontSize: 22,
    letterSpacing: 1.2,
    color: darkText,
  );

  static const TextStyle headline4 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: darkText,
  );

  static const TextStyle headline5 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.normal,
    fontSize: 16,
    letterSpacing: 0.27,
    color: darkText,
  );

  static const TextStyle headline6 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.normal,
    fontSize: 16,
    letterSpacing: 0.18,
    color: lightTextDefault,
  );

  static const TextStyle subtitle1 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: 0.05,
    color: darkText,
  );

  static const TextStyle subtitle2 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.normal,
    fontSize: 14,
    letterSpacing: -0.04,
    color: darkText,
  );

  static const TextStyle body1 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: darkText,
  );

  static const TextStyle body2 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: darkText,
  );

  static const TextStyle caption = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: greyText,
  );

  // Dark Text

  static const TextStyle titleTextStyleDark = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w700,
    fontSize: 22,
    letterSpacing: 1.2,
    color: lightText,
  );

  static const TextStyle headline1Dark = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w700,
    fontSize: 22,
    letterSpacing: 1.2,
    color: lightText,
  );

  static const TextStyle headline4Dark = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 36,
    letterSpacing: 0.4,
    height: 0.9,
    color: lightText,
  );

  static const TextStyle headline5Dark = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.normal,
    fontSize: 16,
    letterSpacing: 0.27,
    color: lightText,
  );

  static const TextStyle headline6Dark = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.normal,
    fontSize: 16,
    letterSpacing: 0.18,
    color: lightText,
  );

  static const TextStyle subtitle1Dark = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: 0.05,
    color: lightText,
  );

  static const TextStyle subtitle2Dark = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.normal,
    fontSize: 14,
    letterSpacing: -0.04,
    color: lightText,
  );

  static const TextStyle body1Dark = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: -0.05,
    color: lightText,
  );

  static const TextStyle body2Dark = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.2,
    color: lightText,
  );

  static const TextStyle captionDark = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: greyText,
  );
}
