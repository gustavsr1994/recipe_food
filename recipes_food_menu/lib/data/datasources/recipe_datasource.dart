import 'package:dio/dio.dart';
import 'package:recipes_food_menu/data/models/detailrecipe/detail_recipe.dart';
import 'package:recipes_food_menu/data/network/dio_client.dart';
import 'package:recipes_food_menu/data/models/recipes/recipes_response.dart';

abstract class RecipeDataSource {
  Future<RecipesResponse> listRecipe(String keyword);
  Future<DetailRecipeResponse> detailRecipe(int idRecipe);
}

class RecipeApi extends RecipeDataSource {
  final DioClient? dio;
  RecipeApi({this.dio});

  @override
  Future<RecipesResponse> listRecipe(String keyword) async {
    Response response =
        await dio!.dio.get('/recipes/search?query=$keyword&number=50&offset=0');

    return RecipesResponse.fromJson(response.data);
  }

  @override
  Future<DetailRecipeResponse> detailRecipe(int idRecipe) async {
    Response response = await dio!.dio.get('/recipes/$idRecipe/information');
 
    return DetailRecipeResponse.fromJson(response.data); }
}
