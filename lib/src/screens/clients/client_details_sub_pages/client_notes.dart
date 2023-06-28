import 'package:flutter/material.dart';

class ClientNotesPage extends StatefulWidget {
  final TextEditingController controller;
  const ClientNotesPage({Key? key, required this.controller}) : super(key: key);

  @override
  State<ClientNotesPage> createState() => _ClientNotesPageState();
}

class _ClientNotesPageState extends State<ClientNotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: widget.controller,
                maxLines: null, // Allow multiple lines
                expands: true,
                textAlignVertical:
                    TextAlignVertical.top, // Align text to the top
                decoration: InputDecoration(
                  hintText: 'Client notes here...',
                  border: InputBorder.none, // Remove all borders
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
