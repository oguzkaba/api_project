import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget(
      {Key? key,
      required this.controller,
      this.suffixIcon,
      this.hintText,
      this.color,
      this.width,
      this.readOnly,
      this.change,
      this.obsecure,
      this.changeObsecure,
      this.enabled})
      : super(key: key);

  final TextEditingController controller;
  final bool? readOnly;
  final bool? enabled;
  final double? width;
  final String? hintText;
  final Color? color;
  final Function(String)? change;
  final IconData? suffixIcon;
  final bool? obsecure;
  final Function()? changeObsecure;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: 40,
      child: TextField(
        obscureText: obsecure ?? false,
        onChanged: change,
        enabled: enabled ?? true,
        readOnly: readOnly ?? false,
        autofocus: false,
        controller: controller,
        decoration: InputDecoration(
            suffixIcon:
                IconButton(onPressed: changeObsecure, icon: Icon(suffixIcon)),
            filled: true,
            fillColor: color ?? Colors.transparent,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            hintText: hintText ?? "",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
      ),
    );
  }
}
