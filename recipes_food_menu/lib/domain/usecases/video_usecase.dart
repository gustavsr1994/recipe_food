import 'package:recipes_food_menu/data/repositories/video_repository.dart';
import 'package:recipes_food_menu/domain/entities/video_entity.dart';

abstract class VideoUsecase {
  Future<List<VideoEntity>> listVideo(String keyword);
}

class VideoUsecaseImpl extends VideoUsecase {
  VideoRepository? repository;
  VideoUsecaseImpl({this.repository});

  @override
  Future<List<VideoEntity>> listVideo(String keyword) =>
      repository!.listVideo(keyword);
}
