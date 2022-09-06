import 'package:flutter/material.dart';
import 'package:lesson_mobx/pages/detail/detail_store.dart';
import 'package:lesson_mobx/pages/update/update_store.dart';

import '../../model/post_model.dart';

class UpdatePage extends StatelessWidget {
  final Post post;

  UpdatePage({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UpdateStore store = UpdateStore();
    store.titleController.text = post.title;
    store.bodyController.text = post.body;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => store.updatePost(
                  context,
                  store.titleController.text.trim(),
                  store.bodyController.text.trim(),
                  post.id),
              icon: const Icon(Icons.done)),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                TextField(
                  controller: store.titleController,
                  decoration: const InputDecoration(hintText: "Title"),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: store.bodyController,
                  decoration: const InputDecoration(hintText: "Content"),
                )
              ],
            ),
          ),
          store.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
