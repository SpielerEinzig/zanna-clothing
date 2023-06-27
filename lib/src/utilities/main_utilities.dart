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

  showImagePickerBottomSheet({
    required context,
    required VoidCallback fileSelected,
    required VoidCallback cameraSelected,
  }) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
      ),
      builder: (context) => Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.25,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _ImageSourceButton(
                  text: "Camera",
                  iconData: Icons.camera,
                  onTap: cameraSelected,
                ),
                const Divider(thickness: 0.25, color: Colors.black),
                _ImageSourceButton(
                  text: "Gallery",
                  iconData: Icons.photo_library_outlined,
                  onTap: fileSelected,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ImageSourceButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final IconData iconData;
  const _ImageSourceButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 26,
            color: Colors.black,
          ),
          const SizedBox(width: 15),
          Text(
            "Pick an image from: $text",
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
