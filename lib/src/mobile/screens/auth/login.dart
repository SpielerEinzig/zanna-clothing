import 'package:flutter/material.dart';
import 'package:zannas_clothing/src/mobile/screens/auth/sign_up.dart';
import 'package:zannas_clothing/src/mobile/screens/shops/shop_list.dart';

import '../../utilities/page_navigation.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login to your account",
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
                        text: "Welcome\n\n",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        children: [
                          TextSpan(
                            text: "Login to your account",
                            style: TextStyle(
                              fontSize: 25,
                              letterSpacing: 1.2,
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
                    text: "Log in",
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
                      page: const SignUp(),
                    );
                  },
                  child: const Text("Sign up"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
