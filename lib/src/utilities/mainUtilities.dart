import 'package:flutter/material.dart';

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
}
