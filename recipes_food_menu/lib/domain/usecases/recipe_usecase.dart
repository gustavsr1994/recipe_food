import 'package:recipes_food_menu/data/repositories/recipe_repository.dart';
import 'package:recipes_food_menu/domain/entities/recipe_entity.dart';

abstract class RecipeUsecase {
  Future<RecipeEntity> searchRecipe(String keyword);
}
class RecipeUsecaseImpl extends RecipeUsecase {
  RecipeRepository? repository;
  RecipeUsecaseImpl({this.repository});
  @override
  Future<RecipeEntity> searchRecipe(String keyword) =>
      repository!.searchRecipe(keyword);
  
}