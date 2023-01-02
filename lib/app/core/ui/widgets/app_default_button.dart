import 'package:flutter/material.dart';
import 'package:foodie/app/core/ui/ui_config.dart';

class AppDefaultButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final BorderRadiusGeometry? borderRadiusGeometry;
  final Gradient? gradient;
  final Color? labelColor;
  final double labelSize;
  final Map<String, double> padding;
  final double? width;
  final double height;

  const AppDefaultButton({
    required this.onPressed,
    required this.label,
    this.borderRadiusGeometry,
    this.gradient,
    this.labelColor,
    this.labelSize = 16,
    this.padding = const {"vertical": 19, "horizontal": 150},
    this.width,
    this.height = 60,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadiusGeometry ?? BorderRadius.circular(8),
        ),
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: gradient ??
              LinearGradient(
                colors: [
                  UIConfig.theme.primaryColorLight,
                  UIConfig.theme.primaryColorDark,
                ],
              ),
          borderRadius: borderRadiusGeometry ?? BorderRadius.circular(8),
        ),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            vertical: padding.values.first,
            horizontal: padding.values.last,
          ),
          width: width ?? MediaQuery.of(context).size.width - 32,
          height: height,
          child: Text(
            label,
            style: TextStyle(
              fontSize: labelSize,
              color: labelColor ?? Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
