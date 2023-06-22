import 'package:flutter/material.dart';

class SearchBarTextField extends StatelessWidget {
  final Color? color;
  final Color? iconColor;
  final String hintText;
  final TextEditingController controller;
  const SearchBarTextField({
    Key? key,
    this.color,
    this.iconColor,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.grey[900],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            color: iconColor ?? Colors.white,
            size: 25,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Center(
              child: TextField(
                controller: controller,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
