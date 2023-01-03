import 'package:flutter/material.dart';
import 'package:foodie/app/core/ui/widgets/app_default_text_form_field.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            AppDefaultTextFormField(
              label: 'Enter Name',
              prefixIcon: const Icon(Icons.person),
              keyboardType: TextInputType.name,
            ),
            AppDefaultTextFormField(
              label: 'Enter Username',
              prefixIcon: const Icon(Icons.person),
            ),
            AppDefaultTextFormField(
              label: 'Enter Phone Number',
              prefixIcon: const Icon(Icons.phone),
              keyboardType: TextInputType.phone,
            ),
            AppDefaultTextFormField(
              label: 'Enter Email',
              prefixIcon: const Icon(Icons.email),
              keyboardType: TextInputType.emailAddress,
            ),
            AppDefaultTextFormField(
              label: 'Enter Password',
              prefixIcon: const Icon(Icons.lock),
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
            ),
            AppDefaultTextFormField(
              label: 'Confirm Password',
              prefixIcon: const Icon(Icons.lock),
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
            ),
          ],
        ),
      ),
    );
  }
}
