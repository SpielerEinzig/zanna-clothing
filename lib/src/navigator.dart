import 'package:flutter/material.dart';
import 'package:zannas_clothing/src/screens/auth/sign_up.dart';

class PageNavigator extends StatefulWidget {
  const PageNavigator({Key? key}) : super(key: key);

  @override
  State<PageNavigator> createState() => _PageNavigatorState();
}

class _PageNavigatorState extends State<PageNavigator> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return size.width <= 800 ? const SignUp() : const SignUp();
  }
}
