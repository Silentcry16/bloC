import 'package:bloc_bootcamp/bloc/app_event.dart';
import 'package:bloc_bootcamp/bloc/app_state.dart';
import 'package:bloc_bootcamp/bloc/bloc.dart';
import 'package:bloc_bootcamp/model/article_model.dart';
import 'package:bloc_bootcamp/repository/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArticleBloc(
        RepositoryProvider.of<Repository>(context),
      )..add(LoadArticleEvent()),
      child: Scaffold(
        body: BlocBuilder<ArticleBloc, ArticleState>(
          builder: (context, state) {
            if (state is ArticleLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ArticleLoadedState) {
              List<ArticleModel> articleList = state.article;
              return ListView.builder(
                itemCount: articleList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(24),
                    child: Card(
                      child: Text(articleList[index].title ?? 'no data'),
                    ),
                  );
                },
              );
            }
            if (state is ArticleErrorState) {
              String err = state.ErrorText;
              return Center(
                child: Text(err),
              );
            }
            return const Center(
              child: Text('No data'),
            );
          },
        ),
      ),
    );
  }
}
