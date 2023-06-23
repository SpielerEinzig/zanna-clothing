import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final Function() onTap;
  final Color? color;
  final Color? indicatorColor;

  const CustomButton({
    Key? key,
    this.color,
    this.indicatorColor,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        setState(() {
          loading = true;
        });

        await widget.onTap();

        setState(() {
          loading = false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: widget.color ?? Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: loading
                ? CircularProgressIndicator(
                    color: widget.indicatorColor ?? Colors.white,
                  )
                : Text(
                    widget.text,
                    style: const TextStyle(
                      fontSize: 22,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
