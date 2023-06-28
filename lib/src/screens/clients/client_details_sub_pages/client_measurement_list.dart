import 'package:flutter/material.dart';

import '../../../widgets/measurement_text_field.dart';

class ClientMeasurementList extends StatefulWidget {
  final TextEditingController headSizeController;
  final TextEditingController neckController;
  final TextEditingController chestController;
  final TextEditingController roundTummyController;
  final TextEditingController roundHipController;
  final TextEditingController roundArmController;
  final TextEditingController topLengthController;
  final TextEditingController kneeController;
  final TextEditingController waistController;
  final TextEditingController lapsController;
  final TextEditingController calfController;
  final TextEditingController roundTipController;
  final TextEditingController pantLengthController;
  final TextEditingController sleeveController;
  final TextEditingController shoulderController;
  const ClientMeasurementList({
    Key? key,
    required this.shoulderController,
    required this.sleeveController,
    required this.headSizeController,
    required this.neckController,
    required this.chestController,
    required this.roundTummyController,
    required this.roundHipController,
    required this.roundArmController,
    required this.topLengthController,
    required this.kneeController,
    required this.waistController,
    required this.lapsController,
    required this.calfController,
    required this.roundTipController,
    required this.pantLengthController,
  }) : super(key: key);

  @override
  State<ClientMeasurementList> createState() => _ClientMeasurementListState();
}

class _ClientMeasurementListState extends State<ClientMeasurementList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 5, bottom: 5),
          child: Text(
            "TOP MEASUREMENT",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        MeasurementTextField(
          hintText: "Head Size",
          title: "Head Size",
          controller: widget.headSizeController,
        ),
        MeasurementTextField(
          hintText: "Neck",
          title: "Neck",
          controller: widget.neckController,
        ),
        MeasurementTextField(
          hintText: "Shoulder",
          title: "Shoulder",
          controller: widget.shoulderController,
        ),
        MeasurementTextField(
          hintText: "Sleeve length",
          title: "Sleeve length",
          controller: widget.sleeveController,
        ),
        MeasurementTextField(
          hintText: "Chest",
          title: "Chest",
          controller: widget.chestController,
        ),
        MeasurementTextField(
          hintText: "Round Tummy",
          title: "Round Tummy",
          controller: widget.roundTummyController,
        ),
        MeasurementTextField(
          hintText: "Round Hip",
          title: "Round Hip",
          controller: widget.roundHipController,
        ),
        MeasurementTextField(
          hintText: "Round Arm",
          title: "Round Arm",
          controller: widget.roundArmController,
        ),
        MeasurementTextField(
          hintText: "Top Length",
          title: "Top Length",
          controller: widget.topLengthController,
        ),

        //bottom
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 20, bottom: 5),
          child: Text(
            "TROUSER MEASUREMENT",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        MeasurementTextField(
          hintText: "Waist",
          title: "Waist",
          controller: widget.waistController,
        ),
        MeasurementTextField(
          hintText: "Laps",
          title: "Laps",
          controller: widget.lapsController,
        ),
        MeasurementTextField(
          hintText: "Knee",
          title: "Knee",
          controller: widget.kneeController,
        ),
        MeasurementTextField(
          hintText: "Round Calf",
          title: "Round Calf",
          controller: widget.calfController,
        ),
        MeasurementTextField(
          hintText: "Round tip",
          title: "Round tip",
          controller: widget.roundTipController,
        ),
        MeasurementTextField(
          hintText: "Pant length",
          title: "Pant length",
          controller: widget.pantLengthController,
        ),
      ],
    );
  }
}
