import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zannas_clothing/src/models/shop_model.dart';
import 'package:zannas_clothing/src/provider/client_provider.dart';
import 'package:zannas_clothing/src/utilities/main_utilities.dart';

import '../models/client_model.dart';
import '../screens/clients/client_details.dart';
import '../utilities/page_navigation.dart';

class ClientCard extends StatelessWidget {
  final ClientModel clientModel;
  final ShopModel? shopModel;
  final String? icon;
  const ClientCard({
    Key? key,
    required this.clientModel,
    required this.shopModel,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: InkWell(
        onTap: () {
          PageNavigation().pushPage(
            context: context,
            page: MeasurementDetails(
                clientModel: clientModel, shopModel: shopModel),
          );
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(icon ?? "🧵"),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${clientModel.name}'s measurements",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          MainUtilities.formatDateTime(clientModel.dateAdded),
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                  onPressed: () async {
                    await context
                        .read<ClientProvider>()
                        .deleteClient(clientModel.id);
                  },
                  icon: const Icon(
                    Icons.delete_forever,
                    color: Colors.red,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
