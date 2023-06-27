import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MainUtilities {
  setTextFieldValue({
    required TextEditingController controller,
    required String text,
  }) {
    String updatedText = controller.text + text;

    controller.value = controller.value.copyWith(
      text: updatedText,
      selection: TextSelection.fromPosition(
        TextPosition(offset: updatedText.length),
      ),
    );
  }

  static String formatDateTime(DateTime dateTime) {
    final DateFormat formatter = DateFormat("hh:mm a d'th' MMM yyyy");
    return formatter.format(dateTime);
  }
}
