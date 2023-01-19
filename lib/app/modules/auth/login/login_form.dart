import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:foodie/app/core/ui/widgets/app_default_button.dart';
import 'package:foodie/app/core/ui/widgets/app_default_text_form_field.dart';
import 'package:foodie/app/modules/auth/widgets/social_auth_widget.dart';
import 'package:validatorless/validatorless.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            AppDefaultTextFormField(
              controller: _emailEC,
              label: AppLocalizations.of(context)!.enterEmailTxt,
              prefixIcon: const Icon(Icons.email),
              keyboardType: TextInputType.emailAddress,
              validator: Validatorless.multiple([
                Validatorless.required(
                  AppLocalizations.of(context)!.requiredEmailTxt,
                ),
                Validatorless.email(
                  AppLocalizations.of(context)!.invalidEmailTxt,
                ),
              ]),
            ),
            const SizedBox(height: 5),
            AppDefaultTextFormField(
              controller: _passwordEC,
              label: AppLocalizations.of(context)!.enterPasswordTxt,
              prefixIcon: const Icon(Icons.lock),
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              validator: Validatorless.multiple([
                Validatorless.required(
                  AppLocalizations.of(context)!.requiredPasswordTxt,
                ),
                Validatorless.min(
                  8,
                  AppLocalizations.of(context)!.weakPasswordTxt,
                ),
              ]),
            ),
            const SizedBox(height: 5),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                ),
                child: Text(
                  AppLocalizations.of(context)!.forgotPasswordTxt,
                  style: const TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 25),
              child: Text(
                AppLocalizations.of(context)!.privacyAndPoliceRegisterTxt,
                maxLines: 2,
                softWrap: true,
                style: const TextStyle(
                  color: Color(0xFF707070),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 16),
            AppDefaultButton(
              onPressed: () {
                final isFormValid = _formKey.currentState?.validate() ?? false;
                if (isFormValid) {
                  debugPrint('Redirect to Home Page');
                }
              },
              label: AppLocalizations.of(context)!.loginTxt,
            ),
            const SizedBox(height: 30),
            Text(
              AppLocalizations.of(context)!.socialLoginTxt,
              style: const TextStyle(
                color: Color(0xFFAAAAAA),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20),
            const SocialAuthWidget(),
          ],
        ),
      ),
    );
  }
}
