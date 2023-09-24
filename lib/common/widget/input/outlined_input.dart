import 'package:flutter/material.dart';
import 'package:amitamin/common/common.dart';

class OutlinedInput extends StatelessWidget {
  const OutlinedInput({
    Key? key,
    this.onChanged,
    this.hintText = '',
    this.keyboardType,
    this.obscureText = false,
    this.enabled = true,
  }) : super(key: key);

  final void Function(String)? onChanged;
  final String hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 12.0,
        ),
      ),
      style: TextStyle(
        color: CustomColor.extraDarkGray,
        fontSize: 15,
        fontWeight: CustomText.body3.fontWeight,
        decorationThickness: 0,
      ),
      cursorColor: CustomColor.primaryBlue100,
    );
  }
}
