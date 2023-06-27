import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zannas_clothing/src/screens/auth/sign_up.dart';
import 'package:zannas_clothing/src/screens/shops/shop_list.dart';

import '../../provider/user_provider.dart';
import '../../utilities/constants.dart';
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
  String errorMessage = "";
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: const TextSpan(
                            text: "Welcome back\n\n",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                            children: [
                              TextSpan(
                                text: "Login to your account",
                                style: TextStyle(
                                  fontSize: 22,
                                  letterSpacing: 1.2,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage('assets/images/logo.png'),
                        )
                      ],
                    ),
                    const SizedBox(height: 30),
                    CustomTextField(
                      hintText: "Enter your email",
                      controller: _emailController,
                      label: "Email",
                      isPassword: false,
                    ),
                    CustomTextField(
                      hintText: "Enter your password",
                      controller: _passwordController,
                      label: "Password",
                      isPassword: showPassword,
                      suffix: InkWell(
                        onTap: () => setState(() {
                          showPassword = !showPassword;
                        }),
                        child: Icon(showPassword
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                    Center(
                      child: Text(
                        errorMessage,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
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
                      if (_emailController.text.isNotEmpty &&
                          _passwordController.text.isNotEmpty) {
                        String response = await context
                            .read<UserProvider>()
                            .loginUser(
                                email: _emailController.text,
                                password: _passwordController.text);

                        if (response == 'success') {
                          await Future.delayed(duration, () {
                            PageNavigation().replacePage(
                              context: context,
                              page: const ShopList(),
                            );
                          });
                        } else {
                          setState(() {
                            errorMessage = response;
                          });
                        }
                      }
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
