part of 'recipe_bloc.dart';

@immutable
abstract class RecipeState {}

class RecipeInitial extends RecipeState {}

class RecipeLoading extends RecipeState {}

class RecipeSuccess extends RecipeState {
  final List<RecipeEntity>? listRecipe;
  RecipeSuccess({this.listRecipe});
}

class RecipeError extends RecipeState {
  final String? message;
  RecipeError({this.message});
}

class RecipeNoConnection extends RecipeState {}
