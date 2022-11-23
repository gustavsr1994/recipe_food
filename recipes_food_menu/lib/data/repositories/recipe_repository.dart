import 'package:recipes_food_menu/data/datasources/recipe_datasource.dart';
import 'package:recipes_food_menu/domain/entities/recipe_entity.dart';

abstract class RecipeRepository {
  Future<RecipeEntity> searchRecipe(String keyword);
}

class RecipeRepositoryImpl extends RecipeRepository {
  RecipeDataSource dataSource;
  RecipeRepositoryImpl({required this.dataSource});

  @override
  Future<RecipeEntity> searchRecipe(String keyword) async {
    var listRecipe = <DataRecipe>[];
    var data = await dataSource.listRecipe(keyword);

    for (var items in data.results!) {
      listRecipe.add(DataRecipe(
          id: items.id,
          title: items.title,
          servings: items.servings,
          readyInMinutes: items.readyInMinutes,
          image: '${data.baseUri}${items.image} '));
    }
    return RecipeEntity(listEntity: listRecipe);
  }
}
