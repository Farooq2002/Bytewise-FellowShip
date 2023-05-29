import 'dart:io';

import 'package:bytwise_week02/widgets/round_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/utils.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({Key? key}) : super(key: key);

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? _image;
  bool loading = false;
  final picker = ImagePicker();

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  final _firebaseDatabase = FirebaseDatabase.instance.ref('post');
  Future getImage() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        debugPrint('some error');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload image'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              getImage();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.deepPurple)),
                  child: _image != null
                      ? Image.file(_image!.absolute)
                      : const Icon(Icons.browse_gallery),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          RoundButton(
              title: 'upload',
              loading: loading,
              onPress: () async {
                setState(() {
                  loading = true;
                });
                firebase_storage.Reference ref = firebase_storage
                    .FirebaseStorage.instance
                    .ref('/image/${DateTime.now().millisecond}');
                firebase_storage.UploadTask uploadTask =
                    ref.putFile(_image!.absolute);
                Future.value(uploadTask);

                var newUrl = await ref.getDownloadURL();
                _firebaseDatabase.child('1').set(
                    {'id': '1234', 'title': newUrl.toString()}).then((value) {
                  setState(() {
                    loading = false;
                  });
                  Utils().toastMessage('uploaded');
                }).onError((error, stackTrace) {
                  Utils().toastMessage(error.toString());
                });
              })
        ],
      ),
    );
  }
}
