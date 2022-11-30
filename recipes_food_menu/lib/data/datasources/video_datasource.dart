import 'package:dio/dio.dart';
import 'package:recipes_food_menu/data/models/video/video_response.dart';
import 'package:recipes_food_menu/data/network/dio_client.dart';

abstract class VideoDataSource {
  
  Future<VideoResponse> listVideo(String keyword);
}

class VideoApi extends VideoDataSource {
  final DioClient? dio;
  VideoApi({this.dio});

  @override
  Future<VideoResponse> listVideo(String keyword) async {
     Response response =
        await dio!.dio.get('/food/videos/search?query=$keyword&minLength=0&maxLength=999&number=10&offset=0');

    return VideoResponse.fromJson(response.data);
  }
}