import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zannas_clothing/src/provider/shop_client_provider.dart';
import 'package:zannas_clothing/src/utilities/mainUtilities.dart';
import 'package:zannas_clothing/src/utilities/show_snackbar.dart';
import 'package:zannas_clothing/src/widgets/custom_text_field.dart';
import 'package:zannas_clothing/src/widgets/multi_line_text_field.dart';

import '../../models/shop_model.dart';
import '../../utilities/constants.dart';
import '../../widgets/custom_button.dart';

class ShopDetails extends StatefulWidget {
  final ShopModel? shopModel;
  const ShopDetails({
    Key? key,
    required this.shopModel,
  }) : super(key: key);

  @override
  State<ShopDetails> createState() => _ShopDetailsState();
}

class _ShopDetailsState extends State<ShopDetails> {
  final TextEditingController _shopNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final MainUtilities _mainUtilities = MainUtilities();

  setTextFieldDetails() {
    if (widget.shopModel != null) {
      _mainUtilities.setTextFieldValue(
          controller: _shopNameController, text: widget.shopModel!.name);
      _mainUtilities.setTextFieldValue(
          controller: _addressController, text: widget.shopModel!.address);
    }
  }

  @override
  void initState() {
    super.initState();
    setTextFieldDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.shopModel != null ? "Edit shop" : "New shop"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Edit this shop's details",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 25),
                    CustomTextField(
                      hintText: "Shop name",
                      controller: _shopNameController,
                      label: "Shop Name",
                      isPassword: false,
                    ),
                    const SizedBox(height: 25),
                    MultiLineTextField(
                      title: "Address",
                      hintText: "Enter the shop's address",
                      controller: _addressController,
                    ),
                  ],
                ),
              ),
            ),
            CustomButton(
              text: "Save",
              onTap: () async {
                if (_shopNameController.text.isNotEmpty &&
                    _addressController.text.isNotEmpty) {
                  if (widget.shopModel != null) {
                    await context.read<ShopClientProvider>().editShop(ShopModel(
                        id: widget.shopModel!.id,
                        name: _shopNameController.text,
                        address: _addressController.text));
                  } else {
                    await context.read<ShopClientProvider>().createShop(
                          address: _addressController.text,
                          name: _shopNameController.text,
                        );
                  }

                  await Future.delayed(duration, () {
                    Navigator.pop(context);
                  });
                } else {
                  showSnackBar(
                      text: "Please make sure all fields are filled",
                      context: context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
