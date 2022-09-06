import 'package:flutter/material.dart';
import 'package:lesson_mobx/pages/home/home_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../model/post_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeStore store = HomeStore()..getAllPost();
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Posts"),
      ),
      body: Observer(builder: (context) {
        return Stack(
          children: [
            ListView.builder(
              itemCount: store.list.length,
              itemBuilder: (context, index) {
                Post post = store.list[index];
                return Card(
                  child: ListTile(
                    title: Text(post.title),
                    leading: IconButton(
                      splashRadius: 25,
                      onPressed: () => store.deletePost(post.id),
                      icon: const Icon(Icons.delete),
                    ),
                    subtitle: Text(post.body),
                    trailing: IconButton(
                      splashRadius: 25,
                      icon: const Icon(Icons.edit),
                      onPressed: () => store.goToUpdatePage(context, post),
                    ),
                  ),
                );
              },
            ),
            store.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : const SizedBox.shrink(),
          ],
        );
      }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => store.goToDetailPage(context),
      ),
    );
  }
}
