import 'package:flutter/material.dart';
import 'package:foodie/app/core/ui/extensions/size_screen_extension.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 152.w,
              height: 156.h,
              fit: BoxFit.fill,
            ),
            SizedBox(height: 159.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(
                  'Good Food Is What We ',
                  style: TextStyle(
                    color: Color(0xFF505050),
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Deliver',
                  style: TextStyle(
                    color: Color(0xFFEE555A),
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
