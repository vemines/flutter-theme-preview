import 'package:flutter/material.dart';

class ColorCard extends StatelessWidget {
  const ColorCard({
    super.key,
    required this.label,
    required this.color,
    required this.textColor,
    this.shadowColor,
    this.size,
    this.elevation,
  });

  final String label;
  final Color color;
  final Color textColor;
  final Color? shadowColor;
  final Size? size;

  /// Defaults to 0 if not provided.
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    const double fontSize = 11;
    final Size effectiveSize = size ?? const Size(86, 58);

    return SizedBox(
      width: effectiveSize.width,
      height: effectiveSize.height,
      child: Card(
        elevation: elevation ?? 0,
        surfaceTintColor: Colors.transparent,
        shadowColor: shadowColor,
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        color: color,
        child: InkWell(
          onTap: () {},
          child: Center(
            child: Text(
              label,
              style: TextStyle(color: textColor, fontSize: fontSize),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
