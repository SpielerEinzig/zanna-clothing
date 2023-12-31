import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zannas_clothing/src/models/client_model.dart';
import 'package:zannas_clothing/src/models/shop_model.dart';
import 'package:zannas_clothing/src/provider/user_provider.dart';
import 'package:zannas_clothing/src/screens/clients/client_details_sub_pages/client_contact_details.dart';
import 'package:zannas_clothing/src/screens/clients/client_details_sub_pages/client_measurement_list.dart';
import 'package:zannas_clothing/src/screens/clients/client_details_sub_pages/client_notes.dart';
import 'package:zannas_clothing/src/utilities/main_utilities.dart';
import 'package:zannas_clothing/src/utilities/show_snackbar.dart';

import '../../provider/client_provider.dart';
import '../../utilities/confirmation_dialog.dart';
import '../../utilities/constants.dart';
import '../../utilities/page_navigation.dart';
import '../../widgets/custom_button.dart';

class MeasurementDetails extends StatefulWidget {
  final ShopModel? shopModel;
  final ClientModel? clientModel;
  const MeasurementDetails({
    Key? key,
    required this.clientModel,
    required this.shopModel,
  }) : super(key: key);

  @override
  State<MeasurementDetails> createState() => _MeasurementDetailsState();
}

class _MeasurementDetailsState extends State<MeasurementDetails> {
  final TextEditingController _notesController = TextEditingController();
  //client detail controller
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController birthday = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController postal = TextEditingController();
  final TextEditingController profession = TextEditingController();
  final TextEditingController occasion = TextEditingController();
  final PageNavigation _navigation = PageNavigation();
  final MainUtilities _utilities = MainUtilities();
  //measurement controllers
  final TextEditingController sleeveController = TextEditingController();
  final TextEditingController headSizeController = TextEditingController();
  final TextEditingController neckController = TextEditingController();
  final TextEditingController chestController = TextEditingController();
  final TextEditingController roundTummyController = TextEditingController();
  final TextEditingController roundHipController = TextEditingController();
  final TextEditingController roundArmController = TextEditingController();
  final TextEditingController topLengthController = TextEditingController();
  final TextEditingController kneeController = TextEditingController();
  final TextEditingController waistController = TextEditingController();
  final TextEditingController lapsController = TextEditingController();
  final TextEditingController calfController = TextEditingController();
  final TextEditingController roundTipController = TextEditingController();
  final TextEditingController pantLengthController = TextEditingController();
  final TextEditingController shoulderController = TextEditingController();

  initTextFields() {
    _utilities.setTextFieldValue(
        controller: sleeveController, text: widget.clientModel!.sleeve);
    _utilities.setTextFieldValue(
        controller: shoulderController, text: widget.clientModel!.shoulder);
    _utilities.setTextFieldValue(
        controller: _notesController, text: widget.clientModel!.notes);
    _utilities.setTextFieldValue(
        controller: name, text: widget.clientModel!.name);
    _utilities.setTextFieldValue(
        controller: phone, text: widget.clientModel!.phoneNumber);
    _utilities.setTextFieldValue(
        controller: email, text: widget.clientModel!.email);
    _utilities.setTextFieldValue(
        controller: birthday, text: widget.clientModel!.birthday);
    _utilities.setTextFieldValue(
        controller: address, text: widget.clientModel!.address);
    _utilities.setTextFieldValue(
        controller: postal, text: widget.clientModel!.postalCode);
    _utilities.setTextFieldValue(
        controller: profession, text: widget.clientModel!.profession);
    _utilities.setTextFieldValue(
        controller: occasion, text: widget.clientModel!.occasion);
    _utilities.setTextFieldValue(
        controller: headSizeController, text: widget.clientModel!.headSize);
    _utilities.setTextFieldValue(
        controller: neckController, text: widget.clientModel!.neck);
    _utilities.setTextFieldValue(
        controller: chestController, text: widget.clientModel!.chest);
    _utilities.setTextFieldValue(
        controller: roundTummyController, text: widget.clientModel!.roundTummy);
    _utilities.setTextFieldValue(
        controller: roundHipController, text: widget.clientModel!.roundHip);
    _utilities.setTextFieldValue(
        controller: roundArmController, text: widget.clientModel!.roundArm);
    _utilities.setTextFieldValue(
        controller: topLengthController, text: widget.clientModel!.topLength);
    _utilities.setTextFieldValue(
        controller: kneeController, text: widget.clientModel!.knee);
    _utilities.setTextFieldValue(
        controller: waistController, text: widget.clientModel!.waist);
    _utilities.setTextFieldValue(
        controller: lapsController, text: widget.clientModel!.laps);
    _utilities.setTextFieldValue(
        controller: calfController, text: widget.clientModel!.calf);
    _utilities.setTextFieldValue(
        controller: roundTipController, text: widget.clientModel!.roundTip);
    _utilities.setTextFieldValue(
        controller: pantLengthController, text: widget.clientModel!.pantLength);
  }

  @override
  void initState() {
    super.initState();
    if (widget.clientModel != null) {
      initTextFields();
    }
  }

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
            if (widget.clientModel != null)
              Consumer<UserProvider>(builder: (context, userProvider, child) {
                if (userProvider.getUserModel!.role == "admin") {
                  return IconButton(
                    onPressed: () async {
                      bool? popPage = await showDialog(
                          context: context,
                          builder: (context) {
                            return ConfirmationDialog(
                              onAccept: () async {
                                await context
                                    .read<ClientProvider>()
                                    .deleteClient(widget.clientModel!.id);

                                await Future.delayed(duration, () {
                                  Navigator.pop(context, true);
                                });
                              },
                              title: "Remove this client?",
                              acceptLabel: "Yes, remove",
                              content: const Text(
                                  "Are you sure you want to remove this client?"
                                  " You won't be able to recover the client data"),
                            );
                          });

                      if (popPage == true) {
                        await Future.delayed(duration, () {
                          Navigator.pop(context);
                        });
                      }
                    },
                    icon: const Icon(
                      Icons.delete_forever,
                      color: Colors.white,
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              }),
          ],
          title: Text(widget.clientModel != null
              ? widget.clientModel!.name
              : "New client"),
          bottom: TabBar(
            tabs: <Widget>[
              const Tab(
                child: Text(
                  "Profile",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const Tab(
                child: Text(
                  "Measurements",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
              const Tab(
                child: Text(
                  "Notes",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
              // if (widget.clientModel != null)
              //   const Tab(
              //     child: Text(
              //       "Pictures",
              //       style: TextStyle(
              //           color: Colors.white, fontWeight: FontWeight.w600),
              //     ),
              // ),
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
                      name: name,
                      phone: phone,
                      email: email,
                      birthday: birthday,
                      address: address,
                      postal: postal,
                      profession: profession,
                      occasion: occasion,
                    ),
                    ClientMeasurementList(
                        shoulderController: shoulderController,
                        sleeveController: sleeveController,
                        headSizeController: headSizeController,
                        neckController: neckController,
                        chestController: chestController,
                        roundTummyController: roundTummyController,
                        roundHipController: roundHipController,
                        roundArmController: roundArmController,
                        topLengthController: topLengthController,
                        kneeController: kneeController,
                        waistController: waistController,
                        lapsController: lapsController,
                        calfController: calfController,
                        roundTipController: roundTipController,
                        pantLengthController: pantLengthController),
                    // if (widget.clientModel != null)
                    //   ClientImages(
                    //     clientModel: widget.clientModel!,
                    //   ),
                    ClientNotesPage(controller: _notesController),
                  ],
                ),
              ),
              Consumer<UserProvider>(builder: (context, userProvider, child) {
                if (userProvider.getUserModel!.role == "admin") {
                  return CustomButton(
                    text: "Save",
                    onTap: () async {
                      if (name.text.isNotEmpty) {
                        widget.clientModel == null
                            ? await context.read<ClientProvider>().createClient(
                                  clientModel: ClientModel(
                                    shopId: widget.shopModel != null
                                        ? widget.shopModel!.id
                                        : "",
                                    id: widget.clientModel != null
                                        ? widget.clientModel!.id
                                        : "",
                                    address: address.text,
                                    name: name.text,
                                    email: email.text,
                                    occasion: occasion.text,
                                    birthday: birthday.text,
                                    phoneNumber: phone.text,
                                    postalCode: postal.text,
                                    profession: profession.text,
                                    dateAdded: DateTime.now(),
                                    images: [],
                                    headSize: headSizeController.text,
                                    neck: neckController.text,
                                    chest: chestController.text,
                                    roundTummy: roundTummyController.text,
                                    roundHip: roundHipController.text,
                                    roundArm: roundArmController.text,
                                    topLength: topLengthController.text,
                                    knee: kneeController.text,
                                    waist: waistController.text,
                                    laps: lapsController.text,
                                    calf: calfController.text,
                                    roundTip: roundTipController.text,
                                    pantLength: pantLengthController.text,
                                    notes: _notesController.text,
                                    sleeve: sleeveController.text,
                                    shoulder: shoulderController.text,
                                  ),
                                )
                            : await context.read<ClientProvider>().editClient(
                                  ClientModel(
                                    shoulder: shoulderController.text,
                                    sleeve: sleeveController.text,
                                    notes: _notesController.text,
                                    shopId: widget.clientModel!.shopId,
                                    id: widget.clientModel!.id,
                                    address: address.text,
                                    name: name.text,
                                    email: email.text,
                                    occasion: occasion.text,
                                    birthday: birthday.text,
                                    phoneNumber: phone.text,
                                    postalCode: postal.text,
                                    profession: profession.text,
                                    dateAdded: widget.clientModel!.dateAdded,
                                    images: [],
                                    headSize: headSizeController.text,
                                    neck: neckController.text,
                                    chest: chestController.text,
                                    roundTummy: roundTummyController.text,
                                    roundHip: roundHipController.text,
                                    roundArm: roundArmController.text,
                                    topLength: topLengthController.text,
                                    knee: kneeController.text,
                                    waist: waistController.text,
                                    laps: lapsController.text,
                                    calf: calfController.text,
                                    roundTip: roundTipController.text,
                                    pantLength: pantLengthController.text,
                                  ),
                                );

                        await Future.delayed(duration, () {
                          Navigator.pop(context);
                        });
                      } else {
                        showSnackBar(
                            text: "Please enter the client's name",
                            context: context);
                      }
                    },
                  );
                } else {
                  return const SizedBox();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
