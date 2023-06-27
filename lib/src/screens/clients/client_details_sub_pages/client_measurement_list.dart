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
  final TextEditingController pantController;
  final TextEditingController waistController;
  final TextEditingController lapsController;
  final TextEditingController calfController;
  final TextEditingController pantTipController;
  final TextEditingController pantLengthController;
  const ClientMeasurementList({
    Key? key,
    required this.headSizeController,
    required this.neckController,
    required this.chestController,
    required this.roundTummyController,
    required this.roundHipController,
    required this.roundArmController,
    required this.topLengthController,
    required this.pantController,
    required this.waistController,
    required this.lapsController,
    required this.calfController,
    required this.pantTipController,
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
        MeasurementTextField(
          hintText: "Pant",
          title: "Pant",
          controller: widget.pantController,
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
          hintText: "Calf",
          title: "Calf",
          controller: widget.calfController,
        ),
        MeasurementTextField(
          hintText: "Pant tip",
          title: "Pant tip",
          controller: widget.pantTipController,
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
