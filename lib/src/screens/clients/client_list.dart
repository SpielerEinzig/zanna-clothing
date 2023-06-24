import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zannas_clothing/src/models/shop_model.dart';
import 'package:zannas_clothing/src/provider/client_provider.dart';

import '../../utilities/page_navigation.dart';
import '../../widgets/client_card.dart';
import '../../widgets/search_bar_text_field.dart';
import 'measurement_details.dart';

class ClientList extends StatefulWidget {
  final ShopModel? shopModel;
  const ClientList({Key? key, required this.shopModel}) : super(key: key);

  @override
  State<ClientList> createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("assets/images/logo.png"),
            ),
            const SizedBox(width: 10),
            Text(
              widget.shopModel != null
                  ? "${widget.shopModel!.name} clients"
                  : "All clients",
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: SearchBarTextField(
                        hintText: "Search for a client",
                        controller: _searchController),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.list,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              Expanded(
                child: Consumer<ClientProvider>(
                    builder: (context, clients, child) {
                  return clients.getClientList.isEmpty
                      ? const Center(
                          child:
                              Text("You don't have any clients in this shop"),
                        )
                      : ListView.builder(
                          itemCount: clients.getClientList.length,
                          itemBuilder: (context, index) {
                            return ClientCard(
                                onTap: () {},
                                dateTime:
                                    clients.getClientList[index].dateAdded,
                                name: clients.getClientList[index].name);
                          });
                }),
              ),
            ],
          )),
      floatingActionButton: IconButton(
        onPressed: () {
          PageNavigation().pushPage(
            context: context,
            page: const MeasurementDetails(),
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
