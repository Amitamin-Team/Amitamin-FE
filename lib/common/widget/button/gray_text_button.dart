import 'package:flutter/material.dart';
import 'package:amitamin/common/common.dart';

class GrayTextButton extends StatelessWidget {
  const GrayTextButton({
    Key? key,
    this.disabled = false,
    this.onPressed,
    required this.text,
  }) : super(key: key);

  final String text;
  final bool disabled;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 47,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: disabled ? CustomColor.lightGray : CustomColor.primaryBlue100,
          side: BorderSide(
            width: 1,
            color: disabled ? CustomColor.lightGray : CustomColor.primaryBlue100,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: CustomText.body5.fontSize,
            fontWeight: CustomText.body5.fontWeight,
            fontFamily: CustomText.body5.fontFamily,
            color: disabled ? CustomColor.extraDarkGray : CustomColor.white,
          ),
        ),
      ),
    );
  }
}
