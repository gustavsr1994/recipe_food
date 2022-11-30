import 'package:recipes_food_menu/data/datasources/video_datasource.dart';
import 'package:recipes_food_menu/domain/entities/video_entity.dart';

abstract class VideoRepository {
  Future<List<VideoEntity>> listVideo(String keyword);
}

class VideoRepositoryImpl extends VideoRepository {
  VideoDataSource dataSource;
  VideoRepositoryImpl({required this.dataSource});
  @override
  Future<List<VideoEntity>> listVideo(String keyword) async {
    var listRecipe = <VideoEntity>[];
    var data = await dataSource.listVideo(keyword);

    for (var items in data.videos!) {
      listRecipe.add(VideoEntity(
        title: items.title,
        thumbnail: items.thumbnail,
        views: items.views,
        length: '${items.length} minute',
        youTubeId: 'https://www.youtube.com/watch?v=${items.youTubeId}'
      ));
    }
    return listRecipe;
  }
}
