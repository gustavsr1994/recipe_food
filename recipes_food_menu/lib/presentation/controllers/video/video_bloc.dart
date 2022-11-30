import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:recipes_food_menu/data/datasources/video_datasource.dart';
import 'package:recipes_food_menu/data/network/api_constant.dart';
import 'package:recipes_food_menu/data/network/dio_client.dart';
import 'package:recipes_food_menu/data/repositories/video_repository.dart';
import 'package:recipes_food_menu/domain/entities/video_entity.dart';
import 'package:recipes_food_menu/domain/usecases/video_usecase.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  VideoBloc() : super(VideoInitial()) {
    on<GetListVideo>((event, emit) async {
      var result = await VideoUsecaseImpl(
              repository: VideoRepositoryImpl(
                  dataSource: VideoApi(
                      dio: DioClient(apiBaseUrl: ApiConstant.baseUrl))))
          .listVideo(event.keyword!);
      try {
        emit(VideoSuccess(listVideo: result));
      } on DioError catch (e) {
        if (e.type == DioErrorType.connectTimeout ||
            e.type == DioErrorType.receiveTimeout) {
          emit(VideoNoConnection());
        } else if (e.type == DioErrorType.other) {
          emit(VideoError(message: e.message));
        } else {
          emit(VideoError(message: e.message));
        }
      }
    });
  }
}
