import 'package:flutter/material.dart';

import '../../../utilities/constants.dart';
import '../../../widgets/measurement_text_field.dart';

class ClientMeasurementList extends StatefulWidget {
  final Function(Map) onChanged;
  const ClientMeasurementList({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<ClientMeasurementList> createState() => _ClientMeasurementListState();
}

class _ClientMeasurementListState extends State<ClientMeasurementList> {
  Map measurementMap = {
    "HeadSize": "",
    "Neck": "",
    "Chest": "",
    "RoundTummy": "",
    "RoundHip": "",
    "RoundArm": "",
    "RopLength": "",
    "Pant": "",
    "Waist": "",
    "Laps": "",
    "Calf": "",
    "PantTip": "",
    "PantLength": "",
  };

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: measurements.length,
      itemBuilder: (context, index) {
        return MeasurementTextField(
          value: 180,
          hintText: measurements[index],
          title: measurements[index],
          onChanged: (text) {
            setState(() {
              measurementMap[measurements[index].replaceAll(" ", "")];
            });

            widget.onChanged(measurementMap);
          },
        );
      },
    );
  }
}
