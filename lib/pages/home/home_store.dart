import 'package:flutter/material.dart';
import 'package:lesson_mobx/pages/detail/detail_page.dart';
import 'package:lesson_mobx/pages/update/update_page.dart';

import 'package:mobx/mobx.dart';

import '../../model/post_model.dart';
import '../../service/network_service.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  List<Post> list = [];
  @observable
  bool isLoading = false;

  @action
  Future<void> getAllPost() async {
    isLoading = true;
    String? response = await NetworkService.GET(
        NetworkService.API_LIST, NetworkService.paramsEmpty());
    list = NetworkService.parsePostList(response!);
    isLoading = false;
  }

  @action
  Future<void> goToDetailPage(BuildContext context) async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => DetailPage()));
    getAllPost();
  }

  @action
  Future<void> goToUpdatePage(
    BuildContext context,
    Post post,
  ) async {
    String refresh = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => UpdatePage(
                  post: post,
                )));
    if (refresh == 'refresh') {
      isLoading = true;
      getAllPost();
    }
  }

  @action
  Future<void> deletePost(String id) async {
    isLoading = true;
    String? delete = await NetworkService.DEL(
        NetworkService.API_DELETE + id, NetworkService.paramsEmpty());
    isLoading = false;
    getAllPost();
  }
}
