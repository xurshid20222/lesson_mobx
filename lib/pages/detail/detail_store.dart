import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';

import '../../model/post_model.dart';
import '../../service/network_service.dart';

part 'detail_store.g.dart';

class DetailStore = DetailStoreBase with _$DetailStore;

abstract class DetailStoreBase with Store {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  TextEditingController updateTitleController = TextEditingController();
  TextEditingController updateBodyController = TextEditingController();

  // @observable
  // Post? post;
  @action
  Future<void> createPost(BuildContext context) async {
    String title = titleController.text.trim();
    String body = bodyController.text.trim();
    Post post = Post(
        id: DateTime.now().toIso8601String(),
        title: title,
        body: body,
        userId: '1');

    await NetworkService.POST(
        NetworkService.API_CREATE, NetworkService.paramsCreate(post));
    Navigator.pop(context);
  }

  @action
  Future<void> updatePost(BuildContext context, Post updatePost) async {
    titleController.text = updatePost.title;
    bodyController.text = updatePost.body;
    Post post = Post(
        id: '2',
        title: titleController.text.trim(),
        body: bodyController.text.trim(),
        userId: '1');

    await NetworkService.PUT(
        NetworkService.API_UPDATE, NetworkService.paramsUpdate(post));
    Navigator.pop(context);
  }
}
