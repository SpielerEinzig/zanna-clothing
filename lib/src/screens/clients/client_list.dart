import 'package:flutter/material.dart';

import '../../utilities/page_navigation.dart';
import '../../widgets/client_card.dart';
import '../../widgets/search_bar_text_field.dart';
import 'measurement_details.dart';

class ClientList extends StatefulWidget {
  const ClientList({Key? key}) : super(key: key);

  @override
  State<ClientList> createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/logo.png"),
            ),
            SizedBox(width: 10),
            Text("Victoria Island shop"),
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
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return ClientCard(
                      onTap: () {},
                      dateTime: DateTime.now(),
                      name: "Okafor",
                    );
                  },
                ),
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
