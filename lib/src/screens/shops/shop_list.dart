import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zannas_clothing/src/provider/shop_client_provider.dart';
import 'package:zannas_clothing/src/screens/shops/shop_details.dart';
import 'package:zannas_clothing/src/widgets/shop_card.dart';

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
    context.read<ShopClientProvider>().listenShopList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        title: const Text("SHOPS"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Consumer<ShopClientProvider>(builder: (context, shops, child) {
          return ListView.builder(
              itemCount: shops.getShopList.length,
              itemBuilder: (context, index) {
                return ShopCard(shop: shops.getShopList[index]);
              });
        }),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
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
      ),
    );
  }
}
