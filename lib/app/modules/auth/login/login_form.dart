import 'package:flutter/material.dart';
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
              label: 'Enter Email',
              prefixIcon: const Icon(Icons.email),
              keyboardType: TextInputType.emailAddress,
              validator: Validatorless.multiple([
                Validatorless.required('Required email'),
                Validatorless.email('Invalid email'),
              ]),
            ),
            const SizedBox(height: 5),
            AppDefaultTextFormField(
              controller: _passwordEC,
              label: 'Enter Password',
              prefixIcon: const Icon(Icons.lock),
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              validator: Validatorless.multiple([
                Validatorless.required('Required password'),
                Validatorless.min(
                  8,
                  'Password must contain at least 8 characters',
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
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 25),
              child: Text(
                'By clicking on Login you accept the privacy and policy terms.',
                maxLines: 2,
                softWrap: true,
                style: TextStyle(
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
              label: 'Login',
            ),
            const SizedBox(height: 30),
            const Text(
              'OR, login with',
              style: TextStyle(
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
