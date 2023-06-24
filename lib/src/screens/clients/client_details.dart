import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zannas_clothing/src/models/client_model.dart';
import 'package:zannas_clothing/src/screens/clients/client_details_sub_pages/client_contact_details.dart';
import 'package:zannas_clothing/src/screens/clients/client_details_sub_pages/client_measurement_list.dart';

import '../../provider/client_provider.dart';
import '../../utilities/constants.dart';
import '../../utilities/page_navigation.dart';
import '../../widgets/custom_button.dart';

class MeasurementDetails extends StatefulWidget {
  const MeasurementDetails({Key? key}) : super(key: key);

  @override
  State<MeasurementDetails> createState() => _MeasurementDetailsState();
}

class _MeasurementDetailsState extends State<MeasurementDetails> {
  final PageNavigation _navigation = PageNavigation();
  ClientModel clientModel = ClientModel(
    id: "id",
    address: "address",
    name: "name",
    email: "email",
    occasion: "occasion",
    birthday: "birthday",
    phoneNumber: "phoneNumber",
    postalCode: "postalCode",
    profession: "profession",
    dateAdded: DateTime.now(),
    images: [],
    measurements: {},
  );
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              _navigation.popPagesMultipleTimes(context: context, times: 1);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete_forever,
                color: Colors.white,
              ),
            ),
          ],
          title: const Text("New Client"),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                child: Text(
                  "Profile",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Tab(
                child: Text(
                  "Measurements",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
              Tab(
                child: Text(
                  "Pictures",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: TabBarView(
                  children: [
                    ClientContactDetails(
                      name: (name) {
                        setState(() {
                          clientModel.name = name;
                        });
                      },
                      phone: (phone) {
                        setState(() {
                          clientModel.phoneNumber = phone;
                        });
                      },
                      email: (email) {
                        setState(() {
                          clientModel.email = email;
                        });
                      },
                      birthday: (birthday) {
                        setState(() {
                          clientModel.birthday = birthday;
                        });
                      },
                      address: (address) {
                        setState(() {
                          clientModel.address = address;
                        });
                      },
                      postal: (postal) {
                        setState(() {
                          clientModel.postalCode = postal;
                        });
                      },
                      profession: (profession) {
                        setState(() {
                          clientModel.profession = profession;
                        });
                      },
                      occasion: (occasion) {
                        setState(() {
                          clientModel.occasion = occasion;
                        });
                      },
                    ),
                    ClientMeasurementList(onChanged: (measurements) {
                      setState(() {
                        clientModel.measurements = measurements;
                      });
                    }),
                    GridView.builder(
                      itemCount: clientModel.images.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(clientModel.images[index]),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              CustomButton(
                text: "Save",
                onTap: () async {
                  await context
                      .read<ClientProvider>()
                      .createClient(clientModel);

                  await Future.delayed(duration, () {
                    Navigator.pop(context);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
