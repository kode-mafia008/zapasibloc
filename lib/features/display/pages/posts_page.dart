import 'package:flutter/material.dart';
import '../widgets/post_list.dart';

class PostsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: PostsList(),
    );
  }
}
