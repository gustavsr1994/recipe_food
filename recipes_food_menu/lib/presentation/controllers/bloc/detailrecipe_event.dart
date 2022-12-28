part of 'detailrecipe_bloc.dart';

@immutable
abstract class DetailrecipeEvent {}

class InitialDetail extends DetailrecipeEvent {
  final int? idRecipe;
  InitialDetail({this.idRecipe});
}