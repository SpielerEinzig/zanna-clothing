import 'package:flutter/material.dart';
import 'package:zannas_clothing/src/screens/auth/login.dart';
import 'package:zannas_clothing/src/utilities/page_navigation.dart';
import 'package:zannas_clothing/src/widgets/custom_text_field.dart';

import '../../widgets/custom_button.dart';
import '../shops/shop_list.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create your account",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: const TextSpan(
                        text: "Welcome to\n\n",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        children: [
                          TextSpan(
                            text: "Zanna's clothing\n\n",
                            style: TextStyle(
                              fontSize: 25,
                              letterSpacing: 2,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          TextSpan(
                            text: "Let's get you started",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    CustomTextField(
                      hintText: "Enter your email",
                      controller: _emailController,
                      label: "Email",
                      isPassword: false,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      hintText: "Enter your password",
                      controller: _passwordController,
                      label: "Password",
                      isPassword: false,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onTap: () async {
                      PageNavigation().replacePage(
                        context: context,
                        page: const ShopList(),
                      );
                    },
                    text: "Create an account",
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Or",
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    PageNavigation().replacePage(
                      context: context,
                      page: const Login(),
                    );
                  },
                  child: const Text("Log in"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
