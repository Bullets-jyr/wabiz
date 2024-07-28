import 'package:flutter/material.dart';

// 테마 (main, light)
final ThemeData wabizDefaultTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  // 폰트
  fontFamily: "Pretendard",
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.grey,
  ),
  primaryColor: AppColors.primary,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    // Material 3
    surfaceTintColor: Colors.white,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      side: BorderSide(
        color: AppColors.wabizGray[200]!,
      ),
      foregroundColor: Colors.black,
      textStyle: TextStyle(
        fontSize: 16,
      ),
      minimumSize: Size(64, 50),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Color(0xffd4d4d4),
        width: 1.0,
      ),
    ),
    outlineBorder: BorderSide(
      color: AppColors.primary,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: AppColors.primary,
        width: 1.0,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: AppColors.primary,
        width: 1.0,
      ),
    ),
    hintStyle: TextStyle(
      fontSize: 16,
      color: AppColors.wabizGray[400],
      fontWeight: FontWeight.w500,
    ),
  ),
  dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
);

// 색상 지정
class AppColors extends Color {
  AppColors(super.value);

  static const Color scaffoldBackgroundColor = Color(0xFFF2F4F6);
  static const Color primary = Color(0xFF03C3C4);
  static const Color secondary = Color(0xFFE2F9F9);

  static const Color white = Colors.white;

  static const Color bg = Color(0xFFF2F2F7);
  static const Color newBg = Color(0xFFF2F4F6);

  static const int _grayPrimaryValue = 0xFF848487;

  static const MaterialColor wabizGray = MaterialColor(
    _grayPrimaryValue,
    <int, Color>{
      50: Color(0xFFFFEBEE),
      100: Color(0xFFE5E5EA),
      200: Color(0xFFD4D4D4),
      300: Color(0xFFAEAEB2),
      400: Color(0xFF8E8E93),
      500: Color(_grayPrimaryValue),
      600: Color(0xFF646464),
      700: Color(0xFF4A4A4A),
      800: Color(0xFF303030),
      900: Color(0xFF242424),
    },
  );
}
