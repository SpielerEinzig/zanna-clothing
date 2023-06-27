import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final String label;
  final bool isPassword;
  final Widget? suffix;
  const CustomTextField({
    Key? key,
    this.suffix,
    this.onChanged,
    required this.hintText,
    required this.label,
    required this.isPassword,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            onChanged: onChanged,
            controller: controller,
            keyboardType: isPassword
                ? TextInputType.visiblePassword
                : TextInputType.emailAddress,
            obscureText: isPassword,
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(color: Colors.black),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 1.2,
                    color: Colors.black,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    width: 1.2,
                    color: Colors.black,
                  ),
                ),
                suffix: suffix),
          ),
        ],
      ),
    );
  }
}
