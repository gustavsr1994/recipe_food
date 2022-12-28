part of 'detailrecipe_bloc.dart';

@immutable
abstract class DetailrecipeState {}

class DetailrecipeInitial extends DetailrecipeState {}

class DetailRecipeLoading extends DetailrecipeState {}

class DetailRecipeSuccess extends DetailrecipeState {
  final DetailRecipeEntity? detailRecipe;
  DetailRecipeSuccess({this.detailRecipe});
}

class DetailRecipeError extends DetailrecipeState {
  final String? message;
  DetailRecipeError({this.message});
}

class DetailRecipeNoConnection extends DetailrecipeState {}
