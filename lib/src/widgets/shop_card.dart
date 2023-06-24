import 'package:flutter/material.dart';
import 'package:zannas_clothing/src/models/shop_model.dart';
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
            page: const ClientList(),
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
                  IconButton(
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
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Row(
                children: [
                  SizedBox(width: 17),
                  CircleAvatar(
                    radius: 15,
                    backgroundImage: NetworkImage(dummyImage),
                  ),
                  SizedBox(width: 38),
                  Expanded(
                    child: Text(
                      "Last Client: Obi Cubanna",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  const SizedBox(width: 35),
                  TextButton(
                    onPressed: () {
                      PageNavigation().pushPage(
                        context: context,
                        page: const ClientList(),
                      );
                    },
                    child: const Row(
                      children: [
                        Text("Show all 25 clients"),
                        Icon(Icons.arrow_forward_ios),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
