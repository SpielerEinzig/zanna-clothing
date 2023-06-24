import 'package:flutter/material.dart';

import '../../../widgets/custom_text_field.dart';

class ClientContactDetails extends StatelessWidget {
  final Function(String) name;
  final Function(String) phone;
  final Function(String) email;
  final Function(String) birthday;
  final Function(String) address;
  final Function(String) postal;
  final Function(String) profession;
  final Function(String) occasion;
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
            hintText: "Name",
            label: "Client's Name",
            isPassword: false,
            onChanged: name,
          ),
          CustomTextField(
            hintText: "Client's phone number",
            label: "Phone number",
            isPassword: false,
            onChanged: phone,
          ),
          CustomTextField(
            hintText: "Email",
            label: "Client's email",
            isPassword: false,
            onChanged: email,
          ),
          CustomTextField(
            hintText: "MM/DD/YYYY",
            label: "Client's birthday",
            isPassword: false,
            onChanged: birthday,
          ),
          CustomTextField(
            hintText: "Client's Address",
            label: "Address",
            isPassword: false,
            onChanged: address,
          ),
          CustomTextField(
            hintText: "Postal",
            label: "Postal code",
            isPassword: false,
            onChanged: postal,
          ),
          CustomTextField(
            hintText: "Profession",
            label: "Client's profession",
            isPassword: false,
            onChanged: profession,
          ),
          CustomTextField(
            hintText: "Occasion",
            label: "Special occasion",
            isPassword: false,
            onChanged: occasion,
          ),
        ],
      ),
    );
  }
}
