import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teste_ava/colors.dart';

class WidgetFormFieldDefaut extends StatelessWidget {
  const WidgetFormFieldDefaut({
    required this.title,
    required this.controller,
    required this.hintText,
    required this.textInputType,
    required this.validator,
    this.textCapitalization = TextCapitalization.sentences,
    this.textInputAction = TextInputAction.next,
    this.isVisibleSuffix = false,
    this.inputFormatters,
    this.isObscureText = false,
    this.actionObscureText,
    this.suffixIconVisibility,
    this.suffixIconVisibilityOff,
    this.colorTitle,
    this.onFieldSubmitted,
    this.onChanged,
    this.colorHint,
    super.key,
  });

  final String title;
  final TextEditingController controller;
  final String hintText;
  final Widget? suffixIconVisibility;
  final Widget? suffixIconVisibilityOff;
  final TextInputType textInputType;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final bool isVisibleSuffix;
  final String? Function(String?)? validator;
  final bool isObscureText;
  final void Function()? actionObscureText;
  final Color? colorTitle;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final Color? colorHint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 10),
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: colorTitle
            ),
          ),
        ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: colorHint,
            ),
            suffixIcon: Visibility(
              visible: isVisibleSuffix,
              child: Container(
                height: 30,
                width: 30,
                alignment: Alignment.center,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      AvaColor.appPrimarySwatch,
                      AvaColor.defaultRedColor,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: actionObscureText,
                  icon: isObscureText
                  ? suffixIconVisibility ?? const Text('') : suffixIconVisibilityOff ?? const Text(''),
                ),
              ),
            ),
          ),
          inputFormatters: inputFormatters,
          keyboardType: textInputType,
          textCapitalization: textCapitalization,
          textInputAction: textInputAction,
          validator: validator,
          obscureText: isObscureText,
          onFieldSubmitted: onFieldSubmitted,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
