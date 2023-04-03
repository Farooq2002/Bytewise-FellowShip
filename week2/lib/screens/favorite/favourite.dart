import 'package:bytewise_week_01/providers/favorite_provider.dart';
import 'package:bytewise_week_01/screens/favorite/myfav_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<FavoriteProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Favorite'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyFavotite()));
              },
              icon: const Icon(Icons.favorite_border))
        ],
      ),
      body: Column(
        children: [
          Expanded(child: ListView.builder(itemBuilder: (context, index) {
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
