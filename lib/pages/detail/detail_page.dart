import 'package:flutter/material.dart';
import 'package:lesson_mobx/pages/detail/detail_store.dart';

import '../../model/post_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DetailStore store = DetailStore();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => store.createPost(context),
              icon: const Icon(Icons.save)),
        ],
      ),
      body: Padding(
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
    );
  }
}
