import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        title: const Text("SHOPS"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ShopCard(
                clients: 8,
                shop: "Victoria Island Shop",
              ),
              ShopCard(
                clients: 8,
                shop: "Victoria Island Shop",
              ),
              ShopCard(
                clients: 8,
                shop: "Victoria Island Shop",
              ),
              ShopCard(
                clients: 8,
                shop: "Victoria Island Shop",
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          PageNavigation().pushPage(
            context: context,
            page: const ShopDetails(),
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
