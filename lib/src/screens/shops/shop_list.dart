import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zannas_clothing/src/provider/client_provider.dart';
import 'package:zannas_clothing/src/provider/user_provider.dart';
import 'package:zannas_clothing/src/screens/shops/shop_details.dart';
import 'package:zannas_clothing/src/widgets/app_drawer.dart';
import 'package:zannas_clothing/src/widgets/shop_card.dart';

import '../../provider/shop_provider.dart';
import '../../utilities/page_navigation.dart';

class ShopList extends StatefulWidget {
  const ShopList({Key? key}) : super(key: key);

  @override
  State<ShopList> createState() => _ShopListState();
}

class _ShopListState extends State<ShopList> {
  @override
  void initState() {
    super.initState();
    context.read<ShopProvider>().listenShopList();
    context.read<ClientProvider>().listenClientList();
    context.read<UserProvider>().listenUserDocument();
    context.read<UserProvider>().listenUserAuthDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text("SHOPS"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Consumer<ShopProvider>(builder: (context, shops, child) {
          return ListView.builder(
              itemCount: shops.getShopList.length,
              itemBuilder: (context, index) {
                return ShopCard(shop: shops.getShopList[index]);
              });
        }),
      ),
      floatingActionButton: Consumer<UserProvider>(
        builder: (context, userProvider, chile) {
          if (userProvider.getUserModel != null &&
              userProvider.getUserModel!.role == "admin") {
            return IconButton(
              onPressed: () async {
                PageNavigation().pushPage(
                  context: context,
                  page: const ShopDetails(shopModel: null),
                );
              },
              icon: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
