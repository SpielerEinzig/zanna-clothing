import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:zannas_clothing/src/models/client_model.dart';
import 'package:zannas_clothing/src/provider/client_provider.dart';
import 'package:zannas_clothing/src/utilities/image_picker_service.dart';
import 'package:zannas_clothing/src/utilities/main_utilities.dart';

import '../../../utilities/constants.dart';

class ClientImages extends StatefulWidget {
  final ClientModel clientModel;
  const ClientImages({
    Key? key,
    required this.clientModel,
  }) : super(key: key);

  @override
  State<ClientImages> createState() => _ClientImagesState();
}

class _ClientImagesState extends State<ClientImages> {
  final ImagePickerService _pickerService = ImagePickerService();

  @override
  Widget build(BuildContext context) {
    ClientModel clientModel = context.read<ClientProvider>().getClientList[
        context
            .read<ClientProvider>()
            .getClientList
            .indexOf(widget.clientModel)];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          MainUtilities().showImagePickerBottomSheet(
            context: context,
            fileSelected: () async {
              List<XFile> pickedFiles =
                  await _pickerService.pickMultipleImages();

              await Future.delayed(duration, () async {
                await context.read<ClientProvider>().uploadImagesToClient(
                    clientId: widget.clientModel.id,
                    selectedFiles: pickedFiles);
              });

              setState(() {});
            },
            cameraSelected: () async {
              XFile? pickedFile = await _pickerService.pickImage(null);

              if (pickedFile != null) {
                await Future.delayed(duration, () async {
                  await context.read<ClientProvider>().uploadImagesToClient(
                      clientId: widget.clientModel.id,
                      selectedFiles: [pickedFile]);
                });
              }

              setState(() {});
            },
          );
        },
        shape: const CircleBorder(),
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.add_photo_alternate_rounded,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: clientModel.images.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () async {
                        // PageNavigation().pushPage(
                        //   context: context,
                        //   page:
                        //       ImageDetail(imageUrl: clientModel.images[index]),
                        // );
                        print(clientModel.images[index]);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              clientModel.images[index],
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Center(
                                  child: Icon(Icons.error),
                                );
                              },
                            ),
                          )),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
