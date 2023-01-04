class DetailRecipeEntity {
  int? id;
  String? title;
  String? imgRecipe;
  int? cookTime;
  int? serve;
  num? healthyScore;
  List<String>? listIngredient;
  String? summary;
  List<String>? listCuisine;
  List<String>? listDishTypes;
  List<String>? listDiets;
  List<String>? listOccasions;
  List<Instruction>? listInstruction;
}

class Instruction {
  num? number;
  String? step;
}
