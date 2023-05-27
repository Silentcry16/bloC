class ArticleModel {
  late String? id;
  late String? title;
  late String? image;
  late String? catId;
  late String? catName;
  late String? author;
  late int? view;
  late int? status;
  late bool? isFavorite;
  late String? createdAt;

  ArticleModel(
      {this.id,
      this.title,
      this.image,
      this.catId,
      this.catName,
      this.author,
      this.view,
      this.status,
      this.isFavorite,
      this.createdAt});

  ArticleModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    image = json["image"];
    catId = json["cat_id"];
    catName = json["cat_name"];
    author = json["author"];
    view = int.parse(json["view"]);
    status = int.parse(json["status"]);
    isFavorite = json["isFavorite"];
    createdAt = json["created_at"];
  }
}
