import 'package:dio/dio.dart';
import 'package:recipes_food_menu/domain/models/recipes/recipes_response.dart';

abstract class RecipeDataSource {
  Future<RecipesResponse> listRecipe();
}
class RecipeApi extends RecipeDataSource {
  final Dio? dio;
  RecipeApi({this.dio});

  @override
  Future<RecipesResponse> listRecipe() async {
     Response response = await dio!.get('/viewuserinputtopup');
    return RecipesResponse.fromJson(response.data);
  }
  
}