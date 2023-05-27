import 'package:bloc_bootcamp/model/article_model.dart';
import 'package:dio/dio.dart';

//در اینجا اطلاعات و داده ها را از سرور میگیریم از طریق پکیج Dio.

class Repository {
  String endPoint =
      'https://techblog.sasansafari.com/Techblog/api/article/get.php?command=new';

  Future<List<ArticleModel>> getArticles() async {
    List<ArticleModel> list = [];
    await Dio().get(endPoint).then((value) {
      if (value.statusCode == 200) {
        for (var element in value.data) {
          ArticleModel _article = ArticleModel.fromJson(element);
          list.add(_article);

          //یا  کوتاه تر به این صورت
          // list.add( ArticleModel.fromJson(element));
        }
      }
    });
    return list;
  }
}
