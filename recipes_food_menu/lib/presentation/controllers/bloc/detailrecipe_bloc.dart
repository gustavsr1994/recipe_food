import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:recipes_food_menu/data/datasources/recipe_datasource.dart';
import 'package:recipes_food_menu/data/network/api_constant.dart';
import 'package:recipes_food_menu/data/network/dio_client.dart';
import 'package:recipes_food_menu/data/repositories/recipe_repository.dart';
import 'package:recipes_food_menu/domain/entities/detail_recipe_entity.dart';
import 'package:recipes_food_menu/domain/usecases/recipe_usecase.dart';

part 'detailrecipe_event.dart';
part 'detailrecipe_state.dart';

class DetailrecipeBloc extends Bloc<DetailrecipeEvent, DetailrecipeState> {
  DetailrecipeBloc() : super(DetailrecipeInitial()) {
    on<InitialDetail>((event, emit) async {
      var result = await RecipeUsecaseImpl(
              repository: RecipeRepositoryImpl(
                  dataSource: RecipeApi(
                      dio: DioClient(apiBaseUrl: ApiConstant.baseUrl))))
          .detailRecipe(event.idRecipe!);
      try {
        emit(DetailRecipeSuccess(detailRecipe: result));
      } on DioError catch (e) {
        if (e.type == DioErrorType.connectTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          emit(DetailRecipeNoConnection());
        } else if (e.type == DioErrorType.other) {
          emit(DetailRecipeError(message: e.message));
        } else {
          emit(DetailRecipeError(message: e.message));
        }
      }
    });
  }
}
