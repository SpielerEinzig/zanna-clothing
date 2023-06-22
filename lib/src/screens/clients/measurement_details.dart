import 'package:flutter/material.dart';

import '../../utilities/constants.dart';
import '../../utilities/page_navigation.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/measurement_text_field.dart';

class MeasurementDetails extends StatefulWidget {
  const MeasurementDetails({Key? key}) : super(key: key);

  @override
  State<MeasurementDetails> createState() => _MeasurementDetailsState();
}

class _MeasurementDetailsState extends State<MeasurementDetails> {
  final PageNavigation _navigation = PageNavigation();
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
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
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          CustomTextField(
                            hintText: "Name",
                            controller: _nameController,
                            label: "Client's Name",
                            isPassword: false,
                          ),
                          CustomTextField(
                            hintText: "Client's phone number",
                            controller: _nameController,
                            label: "Phone number",
                            isPassword: false,
                          ),
                          CustomTextField(
                            hintText: "Email",
                            controller: _nameController,
                            label: "Client's email",
                            isPassword: false,
                          ),
                          CustomTextField(
                            hintText: "MM/DD/YYYY",
                            controller: _nameController,
                            label: "Client's birthday",
                            isPassword: false,
                          ),
                          CustomTextField(
                            hintText: "Client's Address",
                            controller: _nameController,
                            label: "Address",
                            isPassword: false,
                          ),
                          CustomTextField(
                            hintText: "Postal",
                            controller: _nameController,
                            label: "Postal code",
                            isPassword: false,
                          ),
                          CustomTextField(
                            hintText: "Profession",
                            controller: _nameController,
                            label: "Client's profession",
                            isPassword: false,
                          ),
                          CustomTextField(
                            hintText: "Occasion",
                            controller: _nameController,
                            label: "Special occasion",
                            isPassword: false,
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      itemCount: measurements.length,
                      itemBuilder: (context, index) {
                        return MeasurementTextField(
                          value: 180,
                          hintText: measurements[index],
                          title: measurements[index],
                          onChanged: (text) {},
                        );
                      },
                    ),
                    GridView.builder(
                      itemCount: 9,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(dummyImage),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              CustomButton(text: "Save", onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
