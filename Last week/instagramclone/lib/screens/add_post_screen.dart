import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_clone/utils/utils.dart';
import 'package:provider/provider.dart';

import '../models/user_model.dart';
import '../providers/user_provider.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _file;
  _selectImage(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Create a post'),
            children: [
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Camera'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = pickImage(ImageSource.camera);
                  setState(() {
                    _file = file;
                  });
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Choose a Photo from gallery'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = pickImage(ImageSource.gallery);

                  setState(() {
                    _file = file;
                  });
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: IconButton(
              icon: const Icon(Icons.cloud_upload),
              onPressed: () => _selectImage(context)),
        ),
        title: const Text('Post to'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Post',
              style: TextStyle(color: Colors.blueAccent),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(user!.photoUrl),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: const TextField(
                    maxLines: 8,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Write a caption...",
                    ),
                  ),
                ),
                SizedBox(
                  height: 45,
                  width: 45,
                  child: AspectRatio(
                    aspectRatio: 487 / 451,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://images.unsplash.com/photo-1679564881633-fc8ef0c9c07f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
                            fit: BoxFit.fill,
                            alignment: FractionalOffset.topCenter),
                      ),
                    ),
                  ),
                ),
                const Divider()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
