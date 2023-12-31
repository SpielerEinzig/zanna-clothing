import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zannas_clothing/src/models/client_model.dart';
import 'package:zannas_clothing/src/models/shop_model.dart';
import 'package:zannas_clothing/src/provider/client_provider.dart';
import 'package:zannas_clothing/src/provider/user_provider.dart';
import 'package:zannas_clothing/src/screens/shops/shop_details.dart';

import '../screens/clients/client_list.dart';
import '../utilities/constants.dart';
import '../utilities/page_navigation.dart';

class ShopCard extends StatelessWidget {
  final String? icon;
  final ShopModel shop;
  const ShopCard({
    Key? key,
    this.icon,
    required this.shop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: InkWell(
        onTap: () {
          PageNavigation().pushPage(
            context: context,
            page: ClientList(shopModel: shop),
          );
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/logo.png"),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                shop.name,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                shop.address,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Consumer<UserProvider>(
                    builder: (context, userProvider, child) {
                      if (userProvider.getUserModel!.role == "admin") {
                        return IconButton(
                          onPressed: () {
                            PageNavigation().pushPage(
                              context: context,
                              page: ShopDetails(shopModel: shop),
                            );
                          },
                          icon: const Icon(
                            Icons.edit,
                            size: 18,
                            color: Colors.white,
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 17),
                  CircleAvatar(
                    radius: 15,
                    backgroundImage: NetworkImage(dummyImage),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Consumer<ClientProvider>(
                        builder: (context, clients, child) {
                      List<ClientModel> clientList =
                          clients.getClientsInShop(shop.id);
                      return Text(
                        clientList.isEmpty
                            ? "No clients in this shop"
                            : "Last Client: ${clientList.first.name}",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      );
                    }),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Consumer<ClientProvider>(
                builder: (context, clients, child) {
                  int clientLength = clients.getClientsInShop(shop.id).length;
                  return Row(
                    children: [
                      const SizedBox(width: 35),
                      TextButton(
                        onPressed: () {
                          PageNavigation().pushPage(
                            context: context,
                            page: ClientList(shopModel: shop),
                          );
                        },
                        child: Row(
                          children: [
                            Text("Show $clientLength clients in this shop"),
                            const Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
