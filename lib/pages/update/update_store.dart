import 'package:flutter/material.dart';

import 'package:mobx/mobx.dart';

import '../../model/post_model.dart';
import '../../service/network_service.dart';

part 'update_store.g.dart';

class UpdateStore = UpdateStoreBase with _$UpdateStore;

abstract class UpdateStoreBase with Store {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  bool isLoading = false;

  @action
  Future<void> updatePost(
      BuildContext context, String title, String body, String id) async {
    isLoading = true;
    Post post = Post(id: id, title: title, body: body, userId: 'userId');

    await NetworkService.PUT(
        NetworkService.API_UPDATE + id, NetworkService.paramsUpdate(post));
    print('===========================================================');
    isLoading = false;
    Navigator.pop(context, 'refresh');
  }
}
