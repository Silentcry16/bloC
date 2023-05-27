import 'package:bloc_bootcamp/bloc/app_event.dart';
import 'package:bloc_bootcamp/bloc/app_state.dart';
import 'package:bloc_bootcamp/repository/repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  late final Repository _repository;

  //This code defines the constructor for the ArticleBloc class. 
  //It takes a Repository object as a parameter and assigns it to the _repository variable.
  // It also calls the superclass constructor super(ArticleLoadingState()), 
  //which initializes the initial state of the bloc to ArticleLoadingState().
  
  ArticleBloc(this._repository) : super(ArticleLoadingState()) {
    on<LoadArticleEvent>((event, emit) async {
      emit(ArticleLoadingState());
      try {
        final articles = await _repository.getArticles();
        emit(ArticleLoadedState(articles));
      } catch (e) {
        emit(ArticleErrorState(e.toString()));
      }
    });
  }
}
