import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:foodie/app/core/ui/widgets/app_default_button.dart';
import 'package:foodie/app/core/ui/widgets/app_default_text_form_field.dart';
import 'package:foodie/app/core/utils/app_custom_validators.dart';
import 'package:foodie/app/modules/auth/widgets/social_auth_widget.dart';
import 'package:validatorless/validatorless.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _usernameEC = TextEditingController();
  final _phoneNumberEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _confirmPasswordEC = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameEC.dispose();
    _usernameEC.dispose();
    _phoneNumberEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    _confirmPasswordEC.dispose();
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
              controller: _nameEC,
              label: AppLocalizations.of(context)!.enterNameTxt,
              prefixIcon: const Icon(Icons.person),
              keyboardType: TextInputType.name,
              validator: Validatorless.multiple([
                Validatorless.required(
                  AppLocalizations.of(context)!.requiredNameTxt,
                ),
                Validatorless.min(
                  3,
                  AppLocalizations.of(context)!.nameTooShortTxt,
                ),
              ]),
            ),
            const SizedBox(height: 5),
            AppDefaultTextFormField(
              controller: _usernameEC,
              label: AppLocalizations.of(context)!.enterUsernameTxt,
              prefixIcon: const Icon(Icons.person),
              validator: Validatorless.multiple([
                Validatorless.required(
                  AppLocalizations.of(context)!.requiredUsernameTxt,
                ),
                Validatorless.onlyCharacters(
                  AppLocalizations.of(context)!.onlyCharactersUsernameTxt,
                ),
                Validatorless.min(
                  6,
                  AppLocalizations.of(context)!.usernameTooShortTxt,
                ),
              ]),
            ),
            const SizedBox(height: 5),
            AppDefaultTextFormField(
              controller: _phoneNumberEC,
              label: AppLocalizations.of(context)!.enterPhoneNumberTxt,
              prefixIcon: const Icon(Icons.phone),
              keyboardType: TextInputType.phone,
              validator: Validatorless.multiple([
                Validatorless.required(
                  AppLocalizations.of(context)!.requiredPhoneNumberTxt,
                ),
                Validatorless.min(
                  11,
                  AppLocalizations.of(context)!.phoneNumberTooShortTxt,
                ),
                Validatorless.max(
                  12,
                  AppLocalizations.of(context)!.phoneNumberTooLongTxt,
                ),
              ]),
            ),
            const SizedBox(height: 5),
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
            AppDefaultTextFormField(
              controller: _confirmPasswordEC,
              label: AppLocalizations.of(context)!.enterConfirmPasswordTxt,
              prefixIcon: const Icon(Icons.lock),
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              validator: Validatorless.multiple([
                Validatorless.required(
                  AppLocalizations.of(context)!.requiredConfirmPasswordTxt,
                ),
                Validatorless.min(
                  8,
                  AppLocalizations.of(context)!.weakConfirmPasswordTxt,
                ),
                AppCustomValidators.compare(
                  _passwordEC,
                  AppLocalizations.of(context)!
                      .passwordAndConfirmPasswordNotEqualTxt,
                ),
              ]),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 25),
              child: Text(
                AppLocalizations.of(context)!.privacyAndPoliceLoginTxt,
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
              label: AppLocalizations.of(context)!.registerFormTxt,
            ),
            const SizedBox(height: 30),
            Text(
              AppLocalizations.of(context)!.socialRegisterTxt,
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
