import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:recipes_food_menu/data/datasources/recipe_datasource.dart';
import 'package:recipes_food_menu/data/network/api_constant.dart';
import 'package:recipes_food_menu/data/network/dio_client.dart';
import 'package:recipes_food_menu/data/repositories/recipe_repository.dart';
import 'package:recipes_food_menu/domain/entities/recipe_entity.dart';
import 'package:recipes_food_menu/domain/usecases/recipe_usecase.dart';

part 'recipe_event.dart';
part 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  RecipeBloc() : super(RecipeInitial()) {
    on<SearchRecipe>((event, emit) async {
      var result = await RecipeUsecaseImpl(
              repository: RecipeRepositoryImpl(
                  dataSource: RecipeApi(
                      dio: DioClient(apiBaseUrl: ApiConstant.baseUrl))))
          .searchRecipe(event.keyword!);
      try {
        emit(RecipeSuccess(listRecipe: result));
      } on DioError catch (e) {
        if (e.type == DioErrorType.connectTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          emit(RecipeNoConnection());
        } else if (e.type == DioErrorType.other) {
          emit(RecipeError(message: e.message));
        } else {
          emit(RecipeError(message: e.message));
        }
      }
    });
  }
}
