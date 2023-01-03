import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:foodie/app/modules/auth/login/login_form.dart';
import 'package:foodie/app/modules/auth/register/register_form.dart';

enum AuthMethodSelected { SIGN_IN, SIGN_UP }

class AuthPage extends StatelessWidget {
  final AuthMethodSelected authMethod;
  final ValueNotifier<AuthMethodSelected> _authMethodVN;

  AuthPage({
    this.authMethod = AuthMethodSelected.SIGN_IN,
    Key? key,
  })  : _authMethodVN = ValueNotifier<AuthMethodSelected>(authMethod),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70 + kToolbarHeight),
                child: Image.asset(
                  'assets/images/logo.png',
                  alignment: Alignment.center,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 8),
              ValueListenableBuilder(
                valueListenable: _authMethodVN,
                builder: (_, authMethodValue, __) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          authMethodValue = AuthMethodSelected.SIGN_IN;
                          _authMethodVN.value = authMethodValue;
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.loginText,
                          style: authMethodValue == AuthMethodSelected.SIGN_IN
                              ? const TextStyle(
                                  color: Color(0xFFEC5359),
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600,
                                )
                              : const TextStyle(
                                  color: Color(0xFFAAAAAA),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        onPressed: () {
                          authMethodValue = AuthMethodSelected.SIGN_UP;
                          _authMethodVN.value = authMethodValue;
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.registerText,
                          style: authMethodValue == AuthMethodSelected.SIGN_UP
                              ? const TextStyle(
                                  color: Color(0xFFEC5359),
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600,
                                )
                              : const TextStyle(
                                  color: Color(0xFFAAAAAA),
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              ValueListenableBuilder(
                valueListenable: _authMethodVN,
                builder: (_, authMethodValue, __) {
                  switch (authMethodValue) {
                    case AuthMethodSelected.SIGN_IN:
                      return const LoginForm();
                    case AuthMethodSelected.SIGN_UP:
                      return const RegisterForm();
                  }
                },
              ),
              const SizedBox(height: 47),
              ValueListenableBuilder(
                valueListenable: _authMethodVN,
                builder: (_, authMethodValue, __) {
                  switch (authMethodValue) {
                    case AuthMethodSelected.SIGN_IN:
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.newUserQuestionText,
                            style: const TextStyle(
                              color: Color(0xFFC0C0C0),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              authMethodValue = AuthMethodSelected.SIGN_UP;
                              _authMethodVN.value = authMethodValue;
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                            ),
                            child: Text(
                              AppLocalizations.of(context)!.registerHereText,
                              style: const TextStyle(
                                color: Color(0xFFF35B5F),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      );
                    case AuthMethodSelected.SIGN_UP:
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppLocalizations.of(context)!
                                    .accountAlreadyExistsQuestionText,
                                style: const TextStyle(
                                  color: Color(0xFFC0C0C0),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  authMethodValue = AuthMethodSelected.SIGN_IN;
                                  _authMethodVN.value = authMethodValue;
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                ),
                                child: Text(
                                  AppLocalizations.of(context)!.loginHereText,
                                  style: const TextStyle(
                                    color: Color(0xFFF35B5F),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 50),
                        ],
                      );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
