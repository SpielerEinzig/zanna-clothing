import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zannas_clothing/src/provider/user_provider.dart';
import 'package:zannas_clothing/src/screens/admin_panel/admin_panel.dart';
import 'package:zannas_clothing/src/screens/clients/client_list.dart';
import 'package:zannas_clothing/src/screens/shops/shop_list.dart';
import 'package:zannas_clothing/src/services/auth_service.dart';
import 'package:zannas_clothing/src/utilities/page_navigation.dart';

import '../screens/auth/login.dart';
import '../utilities/constants.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.black,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/logo.png'),
                      ),
                    ),
                  )),
              Expanded(
                flex: 3,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
                  child: Column(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            _DrawerTextWidget(
                                text: "Shop list", page: ShopList()),
                            _DrawerTextWidget(
                                text: "All clients",
                                page: ClientList(shopModel: null)),
                            Consumer<UserProvider>(
                                builder: (context, userProvider, child) {
                              if (userProvider.getUserModel!.role != "admin") {
                                return _DrawerTextWidget(
                                    text: "Admin panel", page: AdminPanel());
                              } else {
                                return const SizedBox();
                              }
                            }),
                          ],
                        ),
                      ),
                      ListTile(
                        onTap: () async {
                          await AuthService().logoutUser();

                          await Future.delayed(duration, () {
                            PageNavigation().replacePage(
                                context: context, page: const Login());
                          });
                        },
                        title: Text(
                          "Logout: ${context.read<UserProvider>().getCurrentUser != null ? context.read<UserProvider>().getCurrentUser!.email! : ""}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        trailing: const Icon(
                          Icons.logout,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class _DrawerTextWidget extends StatelessWidget {
  final String text;
  final Widget page;
  const _DrawerTextWidget({Key? key, required this.text, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        PageNavigation().pushPage(context: context, page: page);
      },
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
          letterSpacing: 2,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        color: Colors.white,
      ),
    );
  }
}
