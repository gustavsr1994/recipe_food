import 'package:recipes_food_menu/data/models/video/video.dart';

class VideoResponse {
  int? totalResults;
  List<Video>? videos;

  VideoResponse({this.totalResults, this.videos});

  VideoResponse.fromJson(Map<String, dynamic> json) {
    totalResults = json['totalResults'];
    if (json['videos'] != null) {
      videos = <Video>[];
      json['videos'].forEach((v) {
        videos!.add(Video.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalResults'] = totalResults;
    if (videos != null) {
      data['videos'] = videos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
