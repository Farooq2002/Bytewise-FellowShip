import 'package:bytwise_week02/ui/firestore/firestore_list_screen.dart';
import 'package:bytwise_week02/utils/utils.dart';
import 'package:bytwise_week02/widgets/round_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddFirestorePost extends StatefulWidget {
  const AddFirestorePost({Key? key}) : super(key: key);

  @override
  State<AddFirestorePost> createState() => _AddFirestorePostState();
}

class _AddFirestorePostState extends State<AddFirestorePost> {
  final fireStore = FirebaseFirestore.instance.collection('users');
  final postController = TextEditingController();
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADD Firestore POST'),
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
                  });
                  String id = DateTime.now().millisecondsSinceEpoch.toString();
                  fireStore.doc(id).set({
                    'title': postController.text.toString(),
                    'id': id
                  }).then((value) {
                    setState(() {
                      loading = false;
                      Utils().toastMessage('pos added');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const FirestoreListScreen()));
                    });
                  }).onError((error, stackTrace) {
                    setState(() {
                      loading = false;
                      Utils().toastMessage(error.toString());
                    });
                  });
                })
          ],
        ),
      ),
    );
  }
}
