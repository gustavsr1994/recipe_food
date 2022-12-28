import 'package:recipes_food_menu/data/repositories/recipe_repository.dart';
import 'package:recipes_food_menu/domain/entities/detail_recipe_entity.dart';
import 'package:recipes_food_menu/domain/entities/recipe_entity.dart';

abstract class RecipeUsecase {
  Future<List<RecipeEntity>> searchRecipe(String keyword);
  Future<DetailRecipeEntity> detailRecipe(int idRecipe);
}

class RecipeUsecaseImpl extends RecipeUsecase {
  RecipeRepository? repository;
  RecipeUsecaseImpl({this.repository});
  @override
  Future<List<RecipeEntity>> searchRecipe(String keyword) =>
      repository!.searchRecipe(keyword);

  @override
  Future<DetailRecipeEntity> detailRecipe(int idRecipe) =>
      repository!.detailRecipe(idRecipe);
}
