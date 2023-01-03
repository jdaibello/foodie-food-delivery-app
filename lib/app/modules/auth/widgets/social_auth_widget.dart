import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodie/app/core/ui/widgets/app_default_rounded_button_with_icon.dart';

class SocialAuthWidget extends StatelessWidget {
  const SocialAuthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppDefaultRoundedButtonWithIcon(
          onTap: () {},
          svgIcon: SvgPicture.asset('assets/images/google_icon.svg'),
          colors: const [
            Color(0xFFFBBC05),
            Color(0xFFEB4335),
            Color(0xFF4285F4),
            Color(0xFF34A853),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AppDefaultRoundedButtonWithIcon(
            onTap: () {},
            svgIcon: SvgPicture.asset('assets/images/facebook_icon.svg'),
            colors: const [Color(0xFF3C5A9A)],
          ),
        ),
        AppDefaultRoundedButtonWithIcon(
          onTap: () {},
          svgIcon: SvgPicture.asset('assets/images/apple_icon.svg'),
          colors: const [Color(0xFF000000)],
        ),
      ],
    );
  }
}
