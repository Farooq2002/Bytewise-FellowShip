import 'package:bytwise_week02/utils/utils.dart';
import 'package:bytwise_week02/widgets/round_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final databaseReference = FirebaseDatabase.instance.ref('names');
  final postController = TextEditingController();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD POST'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: postController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText: 'Whats in your mind!',
                  ),
                ),
              ),
            ),
            RoundButton(
                loading: loading,
                title: 'ADD',
                onPress: () {
                  setState(() {
                    loading = true;
                    // ===================
                  });
                  databaseReference
                      .child(DateTime.now().millisecondsSinceEpoch.toString())
                      .set({
                    'title': postController.text.toString(),
                    'id': DateTime.now().millisecondsSinceEpoch.toString()
                  }).then((value) {
                    setState(() {
                      loading = false;
                    });
                    Utils().toastMessage('post created!');
                  }).onError((error, stackTrace) {
                    setState(() {
                      loading = false;
                    });
                    Utils().toastMessage(error.toString());
                  });
                })
          ],
        ),
      ),
    );
  }
}
