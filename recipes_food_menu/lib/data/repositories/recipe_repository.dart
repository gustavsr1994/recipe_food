import 'package:recipes_food_menu/data/datasources/recipe_datasource.dart';
import 'package:recipes_food_menu/domain/entities/detail_recipe_entity.dart';
import 'package:recipes_food_menu/domain/entities/recipe_entity.dart';

abstract class RecipeRepository {
  Future<List<RecipeEntity>> searchRecipe(String keyword);
  Future<DetailRecipeEntity> detailRecipe(int idRecipe);
}

class RecipeRepositoryImpl extends RecipeRepository {
  RecipeDataSource dataSource;
  RecipeRepositoryImpl({required this.dataSource});

  @override
  Future<List<RecipeEntity>> searchRecipe(String keyword) async {
    var listRecipe = <RecipeEntity>[];
    var data = await dataSource.listRecipe(keyword);

    for (var items in data.results!) {
      listRecipe.add(RecipeEntity(
          id: items.id,
          title: items.title,
          servings: items.servings,
          readyInMinutes: items.readyInMinutes,
          image: '${data.baseUri}${items.image}'));
    }
    return listRecipe;
  }

  @override
  Future<DetailRecipeEntity> detailRecipe(int idRecipe) async {
    var result = DetailRecipeEntity();
    var data = await dataSource.detailRecipe(idRecipe);

    result.id = data.id;
    result.imgRecipe = data.image;
    result.title = data.title;
    result.cookTime = data.cookingMinutes;
    result.healthyScore = data.healthScore;
    result.serve = data.servings;
    result.listCuisine = data.cuisines;
    result.listDiets = data.diets;
    result.listDishTypes = data.dishTypes;
    result.listOccasions = data.occasions;
    if (data.analyzedInstructions!.length != 0) {
      result.listInstruction = <Instruction>[];
      for (var items in data.analyzedInstructions![0].steps!) {
        Instruction datas = Instruction();
        datas.number = items.number;
        datas.step = items.step;
        result.listInstruction!.add(datas);
      }
    }

    if (data.extendedIngredients!.length != 0) {
      result.listIngredient = <String>[];
      for (var items in data.extendedIngredients!) {
        result.listIngredient!.add(items.name! == null ? '' : items.name!);
      }
    }
    result.summary = data.summary;
    return result;
  }
}
