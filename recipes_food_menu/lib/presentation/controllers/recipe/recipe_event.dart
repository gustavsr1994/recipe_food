part of 'recipe_bloc.dart';

@immutable
abstract class RecipeEvent {}

class SearchRecipe extends RecipeEvent {
  final String? keyword;
  SearchRecipe({this.keyword});
}
