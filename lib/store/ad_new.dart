import 'dart:math';

import 'package:mobx/mobx.dart';

import '../model/post.dart';
import '../service/http.dart';

part 'ad_new.g.dart';

class  AdNew = _AdNew with _$AdNew;

abstract class _AdNew with Store{
  @observable bool isLoading = false;

  Future<bool> apiPostCreate(_titleTextEditingController,_bodyTextEditingController)  async {

    isLoading = true;

    Post post = Post(title: _titleTextEditingController.text,
        body: _bodyTextEditingController.text,
        userId: Random().nextInt(pow(2, 10).toInt()+1));
    @observable var response = await Network.POST(Network.API_CREATE, Network.paramsCreate(post));
    isLoading = false;

    return response!=null;
  }
}