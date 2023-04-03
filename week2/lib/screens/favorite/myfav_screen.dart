import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/favorite_provider.dart';

class MyFavotite extends StatefulWidget {
  const MyFavotite({Key? key}) : super(key: key);

  @override
  State<MyFavotite> createState() => _MyFavotiteState();
}

class _MyFavotiteState extends State<MyFavotite> {
  @override
  Widget build(BuildContext context) {
    final MyFavProvider = Provider.of<FavoriteProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Favorite'),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: MyFavProvider.selectedItem.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Consumer<FavoriteProvider>(
                        builder: (context, value, child) {
                          return ListTile(
                            onTap: () {
                              if (value.selectedItem.contains(index)) {
                                value.removeItem(index);
                              } else {
                                value.addItem(index);
                              }
                            },
                            title: Text('Title  $index'),
                            trailing: Icon(value.selectedItem.contains(index)
                                ? Icons.favorite
                                : Icons.favorite_border),
                          );
                        },
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
