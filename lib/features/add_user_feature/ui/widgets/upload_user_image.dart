import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadUserImage extends StatefulWidget {
  const UploadUserImage({super.key});

  @override
  State<UploadUserImage> createState() => _UploadUserImageState();
}

class _UploadUserImageState extends State<UploadUserImage> {
  var image;
  String url = "";
  String path = "";

  uploadImage() async {
    final pickedImg =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    try {
      if (pickedImg != null) {
        setState(() {
          image = File(pickedImg.path);
        });
      } else {
        print("NO img selected");
      }
    } catch (e) {
      print("Error => $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Center(
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(125, 78, 91, 110),
                ),
                child: Stack(
                  children: [
                    image == null
                        ? const CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 225, 225, 225),
                            radius: 71,
                            backgroundImage: 
                                 AssetImage("assets/images/userimage.jpeg"),
                                )
                        : ClipOval(
                            child: Image.file(
                              image!,
                              width: 145,
                              height: 145,
                              fit: BoxFit.cover,
                            ),
                          ),
                    Positioned(
                      left: 99,
                      bottom: -10,
                      child: IconButton(
                        onPressed: () {
                          uploadImage();
                        },
                        icon: const Icon(Icons.add_a_photo),
                        color: const Color.fromARGB(255, 94, 115, 128),
                      ),
                    ),
                  ],
                ),
              ),
            );
           
  }
}