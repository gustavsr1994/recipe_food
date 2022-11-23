class RecipeEntity {
  List<DataRecipe>? listEntity;
  RecipeEntity({this.listEntity});
}

class DataRecipe {
  int? id;
  String? title;
  int? readyInMinutes;
  int? servings;
  String? image;
  DataRecipe({
    this.id,
    this.title,
    this.readyInMinutes,
    this.servings,
    this.image,
  });
}
