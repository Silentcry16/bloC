import 'package:equatable/equatable.dart';

abstract class ArticleEvent extends Equatable {
  const ArticleEvent();
}

class LoadArticleEvent extends ArticleEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
