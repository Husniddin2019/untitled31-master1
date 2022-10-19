import 'package:mobx/mobx.dart';

import '../model/post.dart';
import '../service/http.dart';

part 'home_store.g.dart';

class  HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store{
 @observable List<Post> items =[];
 @observable bool isLoading=false;
  Future apiPost() async {
    isLoading = true;

    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if (response != null) {
      items = Network.parsePost(response);
    } else {
      items = [];
    }
    isLoading = false;

  }

  Future<bool> apiPostDelete(Post post) async {
    isLoading = true;

    var response = await Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    isLoading = false;

    return response!=null;
  }

  Future<bool> apiPostUpdate(Post post)async{
    isLoading = true;
    var response = Network.PUT(Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post));
    isLoading = false;
      return response!=null;
  }
}