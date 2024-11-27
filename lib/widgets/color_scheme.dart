import 'package:flutter/material.dart';

import 'color_card.dart';

Color _onColor(final Color color, final Color bg) =>
    _isLight(Color.alphaBlend(color, bg)) ? Colors.black : Colors.white;

bool _isLight(final Color color) =>
    ThemeData.estimateBrightnessForColor(color) == Brightness.light;

class ColorSchemeColors extends StatelessWidget {
  const ColorSchemeColors({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final Color background = theme.cardColor;

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
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        side: BorderSide(
          color: theme.dividerColor,
          width: 1,
        ),
      );
    }

    return Theme(
      data: Theme.of(context).copyWith(
        cardTheme: CardTheme.of(context).copyWith(
          elevation: 0,
          shape: border,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'ColorScheme Colors',
              style: theme.textTheme.titleLarge,
            ),
          ),
          Wrap(
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 6,
              runSpacing: 6,
              children: <Widget>[
                ColorCard(
                  label: 'Primary',
                  color: colorScheme.primary,
                  textColor: colorScheme.onPrimary,
                ),
                ColorCard(
                  label: 'onPrimary',
                  color: colorScheme.onPrimary,
                  textColor: colorScheme.primary,
                ),
                ColorCard(
                  label: 'Primary\nContainer',
                  color: colorScheme.primaryContainer,
                  textColor: colorScheme.onPrimaryContainer,
                ),
                ColorCard(
                  label: 'onPrimary\nContainer',
                  color: colorScheme.onPrimaryContainer,
                  textColor: colorScheme.primaryContainer,
                ),
                ColorCard(
                  label: 'Primary\nFixed',
                  color: colorScheme.primaryFixed,
                  textColor: colorScheme.onPrimaryFixed,
                ),
                ColorCard(
                  label: 'onPrimary\nFixed',
                  color: colorScheme.onPrimaryFixed,
                  textColor: colorScheme.primaryFixed,
                ),
                ColorCard(
                  label: 'Primary\nFixed\nDim',
                  color: colorScheme.primaryFixedDim,
                  textColor: colorScheme.onPrimaryFixed,
                ),
                ColorCard(
                  label: 'onPrimary\nFixed\nVariant',
                  color: colorScheme.onPrimaryFixedVariant,
                  textColor: colorScheme.primaryFixedDim,
                ),
                ColorCard(
                  label: 'Secondary',
                  color: colorScheme.secondary,
                  textColor: colorScheme.onSecondary,
                ),
                ColorCard(
                  label: 'onSecondary',
                  color: colorScheme.onSecondary,
                  textColor: colorScheme.secondary,
                ),
                ColorCard(
                  label: 'Secondary\nContainer',
                  color: colorScheme.secondaryContainer,
                  textColor: colorScheme.onSecondaryContainer,
                ),
                ColorCard(
                  label: 'onSecondary\nContainer',
                  color: colorScheme.onSecondaryContainer,
                  textColor: colorScheme.secondaryContainer,
                ),
                ColorCard(
                  label: 'Secondary\nFixed',
                  color: colorScheme.secondaryFixed,
                  textColor: colorScheme.onSecondaryFixed,
                ),
                ColorCard(
                  label: 'onSecondary\nFixed',
                  color: colorScheme.onSecondaryFixed,
                  textColor: colorScheme.secondaryFixed,
                ),
                ColorCard(
                  label: 'Secondary\nFixed\nDim',
                  color: colorScheme.secondaryFixedDim,
                  textColor: colorScheme.onSecondaryFixed,
                ),
                ColorCard(
                  label: 'onSecondary\nFixed\nVariant',
                  color: colorScheme.onSecondaryFixedVariant,
                  textColor: colorScheme.secondaryFixedDim,
                ),
                ColorCard(
                  label: 'Tertiary',
                  color: colorScheme.tertiary,
                  textColor: colorScheme.onTertiary,
                ),
                ColorCard(
                  label: 'onTertiary',
                  color: colorScheme.onTertiary,
                  textColor: colorScheme.tertiary,
                ),
                ColorCard(
                  label: 'Tertiary\nContainer',
                  color: colorScheme.tertiaryContainer,
                  textColor: colorScheme.onTertiaryContainer,
                ),
                ColorCard(
                  label: 'onTertiary\nContainer',
                  color: colorScheme.onTertiaryContainer,
                  textColor: colorScheme.tertiaryContainer,
                ),
                ColorCard(
                  label: 'Tertiary\nFixed',
                  color: colorScheme.tertiaryFixed,
                  textColor: colorScheme.onTertiaryFixed,
                ),
                ColorCard(
                  label: 'onTertiary\nFixed',
                  color: colorScheme.onTertiaryFixed,
                  textColor: colorScheme.tertiaryFixed,
                ),
                ColorCard(
                  label: 'Tertiary\nFixed\nDim',
                  color: colorScheme.tertiaryFixedDim,
                  textColor: colorScheme.onTertiaryFixed,
                ),
                ColorCard(
                  label: 'onTertiary\nFixed\nVariant',
                  color: colorScheme.onTertiaryFixedVariant,
                  textColor: colorScheme.tertiaryFixedDim,
                ),
                ColorCard(
                  label: 'Error',
                  color: colorScheme.error,
                  textColor: colorScheme.onError,
                ),
                ColorCard(
                  label: 'onError',
                  color: colorScheme.onError,
                  textColor: colorScheme.error,
                ),
                ColorCard(
                  label: 'Error\nContainer',
                  color: colorScheme.errorContainer,
                  textColor: colorScheme.onErrorContainer,
                ),
                ColorCard(
                  label: 'onError\nContainer',
                  color: colorScheme.onErrorContainer,
                  textColor: colorScheme.errorContainer,
                ),
                ColorCard(
                  label: 'Surface',
                  color: colorScheme.surface,
                  textColor: colorScheme.onSurface,
                ),
                ColorCard(
                  label: 'Surface\nDim',
                  color: colorScheme.surfaceDim,
                  textColor: colorScheme.onSurface,
                ),
                ColorCard(
                  label: 'Surface\nBright',
                  color: colorScheme.surfaceBright,
                  textColor: colorScheme.onSurface,
                ),
                ColorCard(
                  label: 'Surface\nContainer\nLowest',
                  color: colorScheme.surfaceContainerLowest,
                  textColor: colorScheme.onSurface,
                ),
                ColorCard(
                  label: 'Surface\nContainer\nLow',
                  color: colorScheme.surfaceContainerLow,
                  textColor: colorScheme.onSurface,
                ),
                ColorCard(
                  label: 'Surface\nContainer',
                  color: colorScheme.surfaceContainer,
                  textColor: colorScheme.onSurface,
                ),
                ColorCard(
                  label: 'Surface\nContainer\nHigh',
                  color: colorScheme.surfaceContainerHigh,
                  textColor: colorScheme.onSurface,
                ),
                ColorCard(
                  label: 'Surface\nContainer\nHighest',
                  color: colorScheme.surfaceContainerHighest,
                  textColor: colorScheme.onSurface,
                ),
                ColorCard(
                  label: 'onSurface',
                  color: colorScheme.onSurface,
                  textColor: colorScheme.surface,
                ),
                ColorCard(
                  label: 'onSurface\nVariant',
                  color: colorScheme.onSurfaceVariant,
                  textColor: colorScheme.surface,
                ),
                ColorCard(
                  label: 'Outline',
                  color: colorScheme.outline,
                  textColor: _onColor(colorScheme.outline, background),
                ),
                ColorCard(
                  label: 'Outline\nVariant',
                  color: colorScheme.outlineVariant,
                  textColor: _onColor(colorScheme.outlineVariant, background),
                ),
                ColorCard(
                  label: 'Shadow',
                  color: colorScheme.shadow,
                  textColor: _onColor(colorScheme.shadow, background),
                ),
                ColorCard(
                  label: 'Scrim',
                  color: colorScheme.scrim,
                  textColor: _onColor(colorScheme.shadow, background),
                ),
                ColorCard(
                  label: 'Inverse\nSurface',
                  color: colorScheme.inverseSurface,
                  textColor: colorScheme.onInverseSurface,
                ),
                ColorCard(
                  label: 'onInverse\nSurface',
                  color: colorScheme.onInverseSurface,
                  textColor: colorScheme.inverseSurface,
                ),
                ColorCard(
                  label: 'Inverse\nPrimary',
                  color: colorScheme.inversePrimary,
                  textColor: colorScheme.inverseSurface,
                ),
                ColorCard(
                  label: 'Surface\nTint',
                  color: colorScheme.surfaceTint,
                  textColor: colorScheme.onPrimary,
                ),
              ]),
        ],
      ),
    );
  }
}
