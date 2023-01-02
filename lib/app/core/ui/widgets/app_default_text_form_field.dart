import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppDefaultTextFormField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Icon? prefixIcon;
  final ValueNotifier<bool> _obscureTextVN;

  AppDefaultTextFormField({
    required this.label,
    this.controller,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.prefixIcon,
    Key? key,
  })  : _obscureTextVN = ValueNotifier<bool>(obscureText),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _obscureTextVN,
      builder: (_, obscureTextValue, child) {
        return TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obscureTextValue,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFF777777),
            ),
            prefixIcon: prefixIcon,
            prefixIconColor: const Color(0xFFF55D61),
            suffixIcon: obscureText
                ? IconButton(
                    onPressed: () {
                      _obscureTextVN.value = !obscureTextValue;
                    },
                    icon: obscureTextValue
                        ? const Icon(
                            Icons.remove_red_eye,
                            color: Color(0xFFAAAAAA),
                          )
                        : SvgPicture.asset(
                            'assets/images/eye_closed.svg',
                            color: const Color(0xFFAAAAAA),
                          ),
                  )
                : null,
          ),
        );
      },
    );
  }
}
