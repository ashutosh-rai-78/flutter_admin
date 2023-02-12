import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const _commonPadding = EdgeInsets.symmetric(horizontal: 20, vertical: 15);
final _commonBorderRadius = BorderRadius.circular(7);

ColorScheme _seededTheme(Brightness mode) =>
    ColorScheme.fromSeed(seedColor: const Color(0xff1c1c2a), brightness: mode)
        .copyWith(
            primary: const Color(0xff7f7d8c),
            primaryContainer:
                mode == Brightness.light ? null : const Color(0xff1e1e2c),
            surfaceTint:
                mode == Brightness.dark ? const Color(0xff1e1e2c) : null,
            outline: mode == Brightness.dark ? const Color(0xff1c1c2a) : null,
            background: mode == Brightness.dark
                ? const Color(0xFF14141f)
                : const Color(0xfff0eefc));

extension MoreColors on ColorScheme {
  Color get textPrimary => onSurface;
  Color get textSecondary => onSurface.withOpacity(0.7);
  Color get textTertiary => onSurface.withOpacity(0.4);
  Color get clickable => secondaryContainer.withOpacity(0.5);
}

ThemeData getTheme(Brightness mode, {bool useMaterial3 = true}) {
  final seededTheme = _seededTheme(mode);
  return ThemeData(
    brightness: mode,
    appBarTheme: AppBarTheme(
      surfaceTintColor: Colors.transparent,
      backgroundColor: seededTheme.background,
      scrolledUnderElevation: 0,
    ),
    textTheme: GoogleFonts.kumbhSansTextTheme(TextTheme(
        labelMedium: TextStyle(fontSize: 12, color: seededTheme.textPrimary),
        caption: TextStyle(fontSize: 12, color: seededTheme.textSecondary),
        overline: TextStyle(fontSize: 12, color: seededTheme.textSecondary),
        button: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
    inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: seededTheme.textTertiary),
        contentPadding: _commonPadding,
        fillColor: seededTheme.surfaceVariant.withOpacity(.2),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: _commonBorderRadius,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: seededTheme.surfaceVariant, width: 2),
          borderRadius: _commonBorderRadius,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: seededTheme.surfaceVariant, width: 2),
          borderRadius: _commonBorderRadius,
        )),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(_commonPadding),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        side: MaterialStateProperty.all(
            BorderSide(color: seededTheme.primary, width: 2)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: _commonBorderRadius)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(_commonPadding),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: _commonBorderRadius)),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          padding: MaterialStateProperty.all(_commonPadding),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: _commonBorderRadius)),
          foregroundColor: MaterialStateProperty.all(seededTheme.onPrimary),
          backgroundColor: MaterialStateProperty.all(seededTheme.primary)),
    ),
    colorScheme: seededTheme,
    toggleableActiveColor:
        useMaterial3 ? seededTheme.primary : seededTheme.secondary,
    primaryColor: seededTheme.primary,
    primaryColorLight:
        Color.alphaBlend(Colors.white.withAlpha(0x66), seededTheme.primary),
    primaryColorDark:
        Color.alphaBlend(Colors.black.withAlpha(0x66), seededTheme.primary),
    secondaryHeaderColor:
        Color.alphaBlend(Colors.white.withAlpha(0xCC), seededTheme.primary),
    scaffoldBackgroundColor: seededTheme.background,
    canvasColor: seededTheme.background,
    backgroundColor: seededTheme.background,
    cardColor: seededTheme.surface,
    bottomAppBarColor: seededTheme.surface,
    dialogBackgroundColor: seededTheme.surface,
    indicatorColor: seededTheme.onPrimary,
    dividerColor: seededTheme.onSurface.withOpacity(0.12),
    errorColor: seededTheme.error,
    applyElevationOverlayColor: false,
    useMaterial3: useMaterial3,
    visualDensity: VisualDensity.standard,
  );
}
