import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:foodie/app/core/ui/ui_config.dart';
import 'package:foodie/app/core/ui/widgets/app_default_button.dart';
import 'package:foodie/app/modules/auth/auth_page.dart';
import 'package:foodie/app/modules/intro/steps/step_one.dart';
import 'package:foodie/app/modules/intro/steps/step_three.dart';
import 'package:foodie/app/modules/intro/steps/step_two.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late int selectedPage;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    selectedPage = 0;
    _pageController = PageController(initialPage: selectedPage);
  }

  @override
  Widget build(BuildContext context) {
    const int pageCount = 3;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  selectedPage = value;
                });
              },
              children: const [
                StepOne(),
                StepTwo(),
                StepThree(),
              ],
            ),
          ),
          DotsIndicator(
            position: selectedPage.toDouble(),
            dotsCount: pageCount,
            decorator: DotsDecorator(
              color: const Color(0xFFD9D9D9),
              activeColor: UIConfig.theme.primaryColor,
              activeSize: const Size(20, 8),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: AppDefaultButton(
              onPressed: () {
                if (selectedPage == 2) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => const AuthPage(),
                    ),
                  );
                } else {
                  setState(() => _pageController.jumpToPage(selectedPage += 1));
                }
              },
              label: selectedPage == 2
                  ? AppLocalizations.of(context)!.getExploreText
                  : AppLocalizations.of(context)!.nextText,
            ),
          ),
        ],
      ),
    );
  }
}
