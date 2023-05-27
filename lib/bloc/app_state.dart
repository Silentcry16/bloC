import 'package:bloc_bootcamp/model/article_model.dart';
import 'package:equatable/equatable.dart';

abstract class ArticleState extends Equatable {}


//Loading state
class ArticleLoadingState extends ArticleState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


//Loaded state
class ArticleLoadedState extends ArticleState {
  final List<ArticleModel> article;

  ArticleLoadedState(this.article);

  @override
  // TODO: implement props
  List<Object?> get props => [article];
}


//Error state
class ArticleErrorState extends ArticleState {
  final String ErrorText;

  ArticleErrorState(this.ErrorText);
  @override
  // TODO: implement props
  List<Object?> get props => [ErrorText];
}
