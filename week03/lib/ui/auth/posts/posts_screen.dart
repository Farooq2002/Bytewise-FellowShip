import 'package:bytwise_week02/ui/auth/login_screen.dart';
import 'package:bytwise_week02/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import 'add_posts.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  final auth = FirebaseAuth.instance;
  final searchFilter = TextEditingController();
  final updateController = TextEditingController();
  final ref = FirebaseDatabase.instance.ref('names');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('POSTS'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                auth.signOut();
                Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()))
                    .then((value) {
                  Utils().toastMessage(value.toString());
                }).onError((error, stackTrace) {
                  Utils().toastMessage(error.toString());
                });
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                child: TextFormField(
                  onChanged: (val) {
                    setState(() {});
                  },
                  controller: searchFilter,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'SEARCH',
                    prefixIcon: Icon(Icons.search_outlined),
                  ),
                ),
              ),
            ),
          ),
          // const Padding(
          //   padding: EdgeInsets.all(8.0),
          //   child: Text(
          //     'USING STREAM BUILDER',
          //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          //   ),
          // ),
          // Expanded(
          //     //=====================fetching data from firebase realtime database through Stream builder=============
          //     child: StreamBuilder(
          //   stream: ref.onValue,
          //   builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
          //     Map<dynamic, dynamic> map =
          //         snapshot.data!.snapshot.value as dynamic;
          //     List<dynamic> list = [];
          //     list.clear();
          //     list = map.values.toList();
          //     if (!snapshot.hasData) {
          //       return const Center(child: CircularProgressIndicator());
          //     } else {
          //       return ListView.builder(
          //         itemCount: snapshot.data?.snapshot.children.length,
          //         itemBuilder: (context, index) {
          //           return Card(
          //             child: ListTile(
          //               leading: CircleAvatar(
          //                 child: Text(index.toString()),
          //               ),
          //               title: Text(list[index]['title']),
          //               subtitle: Text(list[index]['id']),
          //             ),
          //           );
          //         },
          //       );
          //     }
          //   },
          // )),

          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'USING Firebase Animated List ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),

          //=====================fetching data from firebase realtime database through firebaseAnimated widget=============
          Expanded(
            child: FirebaseAnimatedList(
              defaultChild: const Text('LOADING'),
              itemBuilder: (context, snapshot, animation, index) {
                final title = snapshot.child('title').value.toString();
                if (searchFilter.text.isEmpty) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(index.toString()),
                      ),
                      title: Text(snapshot.child('title').value.toString()),
                      subtitle: Text(snapshot.child('id').value.toString()),
                      trailing: PopupMenuButton(
                        icon: const Icon(Icons.more_vert),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                              value: 1,
                              child: ListTile(
                                onTap: () {},
                                leading: const Icon(Icons.delete_outline),
                                title: const Text('Delete'),
                              )),
                          PopupMenuItem(
                              value: 2,
                              child: ListTile(
                                onTap: () {
                                  Navigator.pop(context);
                                  showMyDialog(title,
                                      snapshot.child('id').value.toString());
                                },
                                leading: const Icon(Icons.edit),
                                title: const Text('Edit'),
                              ))
                        ],
                      ),
                    ),
                  );
                } else if (title
                    .toLowerCase()
                    .contains(searchFilter.text.toLowerCase().toLowerCase())) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text(index.toString()),
                      ),
                      title: Text(snapshot.child('title').value.toString()),
                      subtitle: Text(snapshot.child('id').value.toString()),
                      trailing: PopupMenuButton(
                        icon: const Icon(Icons.more_vert),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                              value: 1,
                              child: PopupMenuItem(
                                child: ListTile(
                                  onTap: () {
                                    Navigator.pop(context);
                                    ref
                                        .child(snapshot
                                            .child('id')
                                            .value
                                            .toString())
                                        .remove();
                                  },
                                  leading: const Icon(Icons.delete_outline),
                                  title: const Text('Delete'),
                                ),
                              )),
                          const PopupMenuItem(
                              value: 2,
                              child: ListTile(
                                leading: Icon(Icons.edit),
                                title: Text('Edit'),
                              ))
                        ],
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
              query: ref,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddPost()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> showMyDialog(String title, String id) async {
    updateController.text = title;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Update'),
            content: TextField(
              controller: updateController,
              decoration: const InputDecoration(hintText: 'edit here'),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ref.child(id).update({
                      'title': updateController.text.toString()
                    }).then((value) {
                      Utils().toastMessage('Post Updated');
                    }).onError((error, stackTrace) {
                      Utils().toastMessage(error.toString());
                    });
                  },
                  child: const Text('Update')),
            ],
          );
        });
  }
}
