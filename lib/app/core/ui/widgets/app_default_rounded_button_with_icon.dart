import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppDefaultRoundedButtonWithIcon extends StatelessWidget {
  final GestureTapCallback onTap;
  final SvgPicture svgIcon;
  final List<Color> colors;

  const AppDefaultRoundedButtonWithIcon({
    required this.onTap,
    required this.svgIcon,
    required this.colors,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          border: colors.length == 1
              ? Border.all(
                  color: colors.first,
                )
              : Border(
                  left: BorderSide(color: colors.first),
                  top: BorderSide(color: colors[1]),
                  right: BorderSide(color: colors[2]),
                  bottom: BorderSide(color: colors.last),
                ),
          // TODO: Fix borderRadius for Border()
          //! borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: svgIcon,
        ),
      ),
    );
  }
}
