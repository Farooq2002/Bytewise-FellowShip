import 'package:flutter/material.dart';
import 'package:insta_clone/screens/add_post_screen.dart';

const webScreenSize = 600;
List<Widget> homeScreenItems = [
  const Center(child: Text('Home')),
  const Center(child: Text('search')),
  const AddPostScreen(),
  const Center(child: Text('fav')),
  const Center(child: Text('person')),
];
