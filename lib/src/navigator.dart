import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zannas_clothing/src/provider/user_provider.dart';
import 'package:zannas_clothing/src/screens/auth/sign_up.dart';
import 'package:zannas_clothing/src/screens/shops/shop_list.dart';

class PageNavigator extends StatefulWidget {
  const PageNavigator({Key? key}) : super(key: key);

  @override
  State<PageNavigator> createState() => _PageNavigatorState();
}

class _PageNavigatorState extends State<PageNavigator> {
  @override
  void initState() {
    super.initState();
    context.read<UserProvider>().getUser();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("We encountered an error. "
                  "Please make sure your phone is connected to internet"),
            );
          } else {
            User? user = context.read<UserProvider>().getCurrentUser;

            return user == null ? const SignUp() : const ShopList();
          }
        },
      ),
    );
  }
}
