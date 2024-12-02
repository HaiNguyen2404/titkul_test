import 'package:flutter/material.dart';
import 'package:titkul_test/util/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType textInputType;
  final Color? fillColor;
  final TextInputAction? textInputAction;
  final bool? obscureText;
  final Iterable<String>? autofillHints;
  final FocusNode? focusNode;
  final bool? readOnly;
  final Icon? icon;
  final void Function()? onTap;
  final EdgeInsetsGeometry? padding;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.textInputType = TextInputType.text,
    this.fillColor,
    this.textInputAction = TextInputAction.next,
    this.obscureText,
    this.autofillHints,
    this.focusNode,
    this.readOnly,
    this.onTap,
    this.icon,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: textInputType,
      decoration: decoration,
      textInputAction: textInputAction,
      obscureText: obscureText ?? false,
      autofillHints: autofillHints,
      focusNode: focusNode,
      readOnly: readOnly ?? false,
      onTap: onTap,
    );
  }

  InputDecoration get decoration {
    return InputDecoration(
      prefixIcon: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: icon,
      ),
      hintText: hintText ?? "",
      hintStyle: const TextStyle(color: AppColors.subtleDark),
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      fillColor: fillColor ?? Colors.white,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: Colors.black,
          width: 0.5,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ).copyWith(
        borderSide: const BorderSide(
          color: Colors.black,
          width: 0.5,
        ),
      ),
    );
  }
}
