import 'package:flutter/material.dart';
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
              label: 'Enter Name',
              prefixIcon: const Icon(Icons.person),
              keyboardType: TextInputType.name,
              validator: Validatorless.multiple([
                Validatorless.required('Required name'),
                Validatorless.min(
                  3,
                  'Name must contain at least 3 characters',
                ),
              ]),
            ),
            const SizedBox(height: 5),
            AppDefaultTextFormField(
              controller: _usernameEC,
              label: 'Enter Username',
              prefixIcon: const Icon(Icons.person),
              validator: Validatorless.multiple([
                Validatorless.required('Required username'),
                Validatorless.onlyCharacters('Only characters are allowed'),
                Validatorless.min(
                  6,
                  'Username must contain at least 6 characters',
                ),
              ]),
            ),
            const SizedBox(height: 5),
            AppDefaultTextFormField(
              controller: _phoneNumberEC,
              label: 'Enter Phone Number',
              prefixIcon: const Icon(Icons.phone),
              keyboardType: TextInputType.phone,
              validator: Validatorless.multiple([
                Validatorless.required('Required phone number'),
                Validatorless.min(
                  11,
                  'Phone number must contain at least 11 digits',
                ),
                Validatorless.max(
                  12,
                  'Phone number must contain at least 12 digits',
                ),
              ]),
            ),
            const SizedBox(height: 5),
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
            AppDefaultTextFormField(
              controller: _confirmPasswordEC,
              label: 'Confirm Password',
              prefixIcon: const Icon(Icons.lock),
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              validator: Validatorless.multiple([
                Validatorless.required('Required confirm password'),
                Validatorless.min(
                  8,
                  'Confirm password must contain at least 8 characters',
                ),
                AppCustomValidators.compare(
                  _passwordEC,
                  'Password and Confirm password must be equals',
                ),
              ]),
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
              label: 'Register',
            ),
            const SizedBox(height: 30),
            const Text(
              'OR, register with',
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
