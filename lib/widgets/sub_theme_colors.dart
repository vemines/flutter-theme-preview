import 'package:flutter/material.dart';

import 'color_card.dart';

class SubThemeColors extends StatelessWidget {
  const SubThemeColors({
    super.key,
    this.onBackgroundColor,
    this.showTitle = true,
  });

  final Color? onBackgroundColor;

  final bool showTitle;

  static bool _isLight(final Color color) =>
      ThemeData.estimateBrightnessForColor(color) == Brightness.light;

  static Color _onColor(final Color color, final Color bg) =>
      _isLight(Color.alphaBlend(color, bg)) ? Colors.black : Colors.white;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final bool isDark = colorScheme.brightness == Brightness.dark;
    final bool useMaterial3 = theme.useMaterial3;

    const double spacing = 6;

    final Color background =
        onBackgroundColor ?? theme.cardTheme.color ?? theme.cardColor;
    ShapeBorder? border = theme.cardTheme.shape;
    if (border is RoundedRectangleBorder) {
      border = border.copyWith(
        side: BorderSide(
          color: theme.dividerColor,
          width: 1,
        ),
      );
    } else {
      border ??= RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(useMaterial3 ? 12 : 4)),
        side: BorderSide(
          color: theme.dividerColor,
          width: 1,
        ),
      );
    }

    final Color elevatedButtonColor = theme
            .elevatedButtonTheme.style?.backgroundColor
            ?.resolve(<WidgetState>{}) ??
        (useMaterial3 ? colorScheme.surface : colorScheme.primary);
    final Color elevatedForegroundButtonColor = theme
            .elevatedButtonTheme.style?.foregroundColor
            ?.resolve(<WidgetState>{}) ??
        (useMaterial3 ? colorScheme.primary : colorScheme.onPrimary);
    final Color filledButtonColor = theme
            .filledButtonTheme.style?.backgroundColor
            ?.resolve(<WidgetState>{}) ??
        colorScheme.primary;
    final Color tonalButtonColor = theme
            .filledButtonTheme.style?.backgroundColor
            ?.resolve(<WidgetState>{}) ??
        colorScheme.secondaryContainer;
    final Color outlinedButtonColor = theme
            .outlinedButtonTheme.style?.foregroundColor
            ?.resolve(<WidgetState>{}) ??
        colorScheme.primary;
    final Color textButtonColor = theme.textButtonTheme.style?.foregroundColor
            ?.resolve(<WidgetState>{}) ??
        colorScheme.primary;
    final Color toggleButtonsColor =
        theme.toggleButtonsTheme.color ?? colorScheme.primary;
    final Color floatingActionButtonColor =
        theme.floatingActionButtonTheme.backgroundColor ??
            (theme.useMaterial3
                ? colorScheme.primaryContainer
                : colorScheme.secondary);
    final Color onFloatingActionButtonColor =
        theme.floatingActionButtonTheme.foregroundColor ??
            (useMaterial3
                ? theme.colorScheme.onPrimaryContainer
                : _onColor(floatingActionButtonColor, background));
    final Color switchColor = theme.switchTheme.thumbColor
            ?.resolve(<WidgetState>{WidgetState.selected}) ??
        (theme.useMaterial3 ? colorScheme.primary : colorScheme.secondary);
    final Color checkboxColor = theme.checkboxTheme.fillColor
            ?.resolve(<WidgetState>{WidgetState.selected}) ??
        (theme.useMaterial3 ? colorScheme.primary : colorScheme.secondary);
    final Color radioColor = theme.radioTheme.fillColor
            ?.resolve(<WidgetState>{WidgetState.selected}) ??
        (theme.useMaterial3 ? colorScheme.primary : colorScheme.secondary);
    final Color circleAvatarColor = useMaterial3
        ? theme.colorScheme.primaryContainer
        : isDark
            ? theme.primaryColorLight
            : theme.primaryColorDark;
    final Color onCircleAvatarColor = useMaterial3
        ? theme.colorScheme.onPrimaryContainer
        : _onColor(circleAvatarColor, background);
    final Color chipColor =
        theme.chipTheme.backgroundColor ?? colorScheme.primary;
    final Color inputDecoratorColor =
        theme.inputDecorationTheme.focusColor?.withAlpha(0xFF) ??
            colorScheme.primary;
    final Decoration? tooltipDecoration = theme.tooltipTheme.decoration;
    final Color tooltipColor = tooltipDecoration is BoxDecoration
        ? tooltipDecoration.color ??
            (isDark
                ? Colors.white.withOpacity(0.9)
                : Colors.grey[700]!.withOpacity(0.9))
        : (isDark
            ? Colors.white.withOpacity(0.9)
            : Colors.grey[700]!.withOpacity(0.9));
    final Color appBarColor = theme.appBarTheme.backgroundColor ??
        (isDark ? colorScheme.surface : colorScheme.primary);
    final Color tabBarColor = theme.tabBarTheme.labelColor ??
        (isDark ? colorScheme.onSurface : colorScheme.onPrimary);
    final Color dialogColor =
        theme.dialogTheme.backgroundColor ?? theme.dialogBackgroundColor;
    final Color defaultSnackBackgroundColor = isDark
        ? colorScheme.onSurface
        : Color.alphaBlend(
            colorScheme.onSurface.withOpacity(0.80), colorScheme.surface);
    final Color snackBarColor =
        theme.snackBarTheme.backgroundColor ?? defaultSnackBackgroundColor;
    final Color snackForeground = theme.snackBarTheme.contentTextStyle?.color ??
        (ThemeData.estimateBrightnessForColor(snackBarColor) == Brightness.light
            ? Colors.black
            : Colors.white);
    final Color bottomNavBarColor =
        theme.bottomNavigationBarTheme.backgroundColor ?? colorScheme.surface;
    final Color bottomNavBarItemColor =
        theme.bottomNavigationBarTheme.selectedItemColor ??
            (isDark ? colorScheme.secondary : colorScheme.primary);
    final Color navigationBarColor = theme.navigationBarTheme.backgroundColor ??
        (useMaterial3
            ? ElevationOverlay.colorWithOverlay(
                colorScheme.surface, colorScheme.primary, 3.0)
            : ElevationOverlay.colorWithOverlay(
                colorScheme.surface, colorScheme.onSurface, 3.0));
    final Color navigationBarItemColor = theme.navigationBarTheme.iconTheme
            ?.resolve(<WidgetState>{WidgetState.selected})?.color ??
        (useMaterial3
            ? colorScheme.onSecondaryContainer
            : colorScheme.onSurface);
    final Color navigationBarIndicatorColor =
        theme.navigationBarTheme.indicatorColor ??
            (useMaterial3
                ? colorScheme.secondaryContainer
                : colorScheme.secondary.withOpacity(.24));
    final Color navigationRailColor =
        theme.navigationRailTheme.backgroundColor ?? colorScheme.surface;
    final Color navigationRailItemColor = theme
            .navigationRailTheme.selectedIconTheme?.color ??
        (useMaterial3 ? colorScheme.onSecondaryContainer : colorScheme.primary);
    final Color navigationRailIndicatorColor =
        theme.navigationRailTheme.indicatorColor ??
            (useMaterial3
                ? colorScheme.onSecondaryContainer
                : colorScheme.secondary.withOpacity(.24));
    final Color textColor = theme.textTheme.titleLarge?.color ??
        (isDark ? Colors.white : Colors.black);
    final Color primTextColor = theme.primaryTextTheme.titleLarge?.color ??
        (ThemeData.estimateBrightnessForColor(colorScheme.primary) ==
                Brightness.dark
            ? Colors.white
            : Colors.black);

    return Theme(
      data: theme.copyWith(
        cardTheme: CardTheme.of(context).copyWith(
          elevation: 0,
          shape: border,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (showTitle)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Component colors',
                style: theme.textTheme.titleLarge,
              ),
            ),
          Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: spacing,
            runSpacing: spacing,
            children: <Widget>[
              ColorCard(
                label: 'Elevated\nButton',
                color: elevatedButtonColor,
                textColor: elevatedForegroundButtonColor,
                elevation: useMaterial3 ? 2 : null,
                shadowColor: Colors.transparent,
              ),
              ColorCard(
                label: 'Filled\nButton',
                color: filledButtonColor,
                textColor: _onColor(filledButtonColor, background),
              ),
              ColorCard(
                label: 'Tonal\nButton',
                color: tonalButtonColor,
                textColor: _onColor(tonalButtonColor, background),
              ),
              ColorCard(
                label: 'Outlined\nButton',
                color: colorScheme.surface,
                textColor: outlinedButtonColor,
              ),
              ColorCard(
                label: 'Text\nButton',
                color: colorScheme.surface,
                textColor: textButtonColor,
              ),
              ColorCard(
                label: 'Toggle\nButtons',
                color: toggleButtonsColor,
                textColor: _onColor(toggleButtonsColor, background),
              ),
              ColorCard(
                label: 'Switch',
                color: switchColor,
                textColor: _onColor(switchColor, background),
              ),
              ColorCard(
                label: 'Checkbox',
                color: checkboxColor,
                textColor: _onColor(checkboxColor, background),
              ),
              ColorCard(
                label: 'Radio',
                color: radioColor,
                textColor: _onColor(radioColor, background),
              ),
              ColorCard(
                label: 'Floating\nAction\nButton',
                color: floatingActionButtonColor,
                textColor: onFloatingActionButtonColor,
              ),
              ColorCard(
                label: 'Circle\nAvatar',
                color: circleAvatarColor,
                textColor: onCircleAvatarColor,
              ),
              ColorCard(
                label: 'Chips',
                color: chipColor,
                textColor: _onColor(chipColor, background),
              ),
              ColorCard(
                label: 'Input\nDecorator',
                color: inputDecoratorColor,
                textColor: _onColor(inputDecoratorColor, background),
              ),
              ColorCard(
                label: 'Tooltip',
                color: tooltipColor,
                textColor: _onColor(tooltipColor, background),
              ),
              ColorCard(
                label: 'AppBar',
                color: appBarColor,
                textColor: _onColor(appBarColor, background),
              ),
              ColorCard(
                label: 'TabBar\nItem',
                color: tabBarColor,
                textColor: _onColor(tabBarColor, background),
              ),
              ColorCard(
                label: 'TabBar\nIndicator',
                color: theme.indicatorColor,
                textColor: _onColor(theme.indicatorColor, background),
              ),
              ColorCard(
                label: 'Dialog\nBackground',
                color: dialogColor,
                textColor: _onColor(dialogColor, background),
              ),
              ColorCard(
                label: 'SnackBar\nBackground',
                color: snackBarColor,
                textColor: snackForeground,
              ),
              ColorCard(
                label: 'Bottom\nNaviBar\nBackground',
                color: bottomNavBarColor,
                textColor: _onColor(bottomNavBarColor, background),
              ),
              ColorCard(
                label: 'Bottom\nNaviBar\nSelected',
                color: bottomNavBarItemColor,
                textColor: _onColor(bottomNavBarItemColor, background),
              ),
              ColorCard(
                label: 'Navigation\nBar\nBackground',
                color: navigationBarColor,
                textColor: _onColor(navigationBarColor, background),
              ),
              ColorCard(
                label: 'Navigation\nBar\nSelected',
                color: navigationBarItemColor,
                textColor: _onColor(navigationBarItemColor, background),
              ),
              ColorCard(
                label: 'Navigation\nBar\nIndicator',
                color: navigationBarIndicatorColor,
                textColor: _onColor(navigationBarIndicatorColor, background),
              ),
              ColorCard(
                label: 'Navigation\nRail\nBackground',
                color: navigationRailColor,
                textColor: _onColor(navigationRailColor, background),
              ),
              ColorCard(
                label: 'Navigation\nRail\nSelected',
                color: navigationRailItemColor,
                textColor: _onColor(navigationRailItemColor, background),
              ),
              ColorCard(
                label: 'Navigation\nRail\nIndicator',
                color: navigationRailIndicatorColor,
                textColor: _onColor(navigationRailIndicatorColor, background),
              ),
              ColorCard(
                label: 'Text\nTheme',
                color: textColor,
                textColor: _onColor(textColor, background),
              ),
              ColorCard(
                label: 'PrimaryText\nTheme',
                color: primTextColor,
                textColor: _onColor(primTextColor, background),
              ),
              ColorCard(
                label: 'Card',
                color: theme.cardColor,
                textColor: colorScheme.onSurface,
              ),
              ColorCard(
                label: 'Disabled\nColor',
                color: theme.disabledColor,
                textColor: _onColor(theme.disabledColor, background),
              ),
              ColorCard(
                label: 'Hover\nColor',
                color: theme.hoverColor,
                textColor: _onColor(theme.hoverColor, background),
              ),
              ColorCard(
                label: 'Focus\nColor',
                color: theme.focusColor,
                textColor: _onColor(theme.focusColor, background),
              ),
              ColorCard(
                label: 'Highlight\nColor',
                color: theme.highlightColor,
                textColor: _onColor(theme.highlightColor, background),
              ),
              ColorCard(
                label: 'Splash\nColor',
                color: theme.splashColor,
                textColor: _onColor(theme.splashColor, background),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
