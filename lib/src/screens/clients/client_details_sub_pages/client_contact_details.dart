import 'package:flutter/material.dart';

import '../../../widgets/custom_text_field.dart';

class ClientContactDetails extends StatelessWidget {
  final TextEditingController name;
  final TextEditingController phone;
  final TextEditingController email;
  final TextEditingController birthday;
  final TextEditingController address;
  final TextEditingController postal;
  final TextEditingController profession;
  final TextEditingController occasion;
  const ClientContactDetails({
    Key? key,
    required this.name,
    required this.phone,
    required this.email,
    required this.birthday,
    required this.address,
    required this.postal,
    required this.profession,
    required this.occasion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomTextField(
            controller: name,
            hintText: "Name",
            label: "Client's Name",
            isPassword: false,
          ),
          CustomTextField(
            controller: phone,
            hintText: "Client's phone number",
            label: "Phone number",
            isPassword: false,
          ),
          CustomTextField(
            controller: email,
            hintText: "Email",
            label: "Client's email",
            isPassword: false,
          ),
          CustomTextField(
            controller: birthday,
            hintText: "MM/DD/YYYY",
            label: "Client's birthday",
            isPassword: false,
          ),
          CustomTextField(
            controller: address,
            hintText: "Client's Address",
            label: "Address",
            isPassword: false,
          ),
          CustomTextField(
            controller: postal,
            hintText: "Postal",
            label: "Postal code",
            isPassword: false,
          ),
          CustomTextField(
            controller: profession,
            hintText: "Profession",
            label: "Client's profession",
            isPassword: false,
          ),
          CustomTextField(
            controller: occasion,
            hintText: "Occasion",
            label: "Special occasion",
            isPassword: false,
          ),
        ],
      ),
    );
  }
}
