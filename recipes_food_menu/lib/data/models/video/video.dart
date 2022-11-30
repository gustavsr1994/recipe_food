
class Video {
  String? title;
  String? shortTitle;
  String? youTubeId;
  double? rating;
  int? views;
  String? thumbnail;
  int? length;

  Video(
      {this.title,
      this.shortTitle,
      this.youTubeId,
      this.rating,
      this.views,
      this.thumbnail,
      this.length});

  Video.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    shortTitle = json['shortTitle'];
    youTubeId = json['youTubeId'];
    rating = json['rating'];
    views = json['views'];
    thumbnail = json['thumbnail'];
    length = json['length'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['shortTitle'] = shortTitle;
    data['youTubeId'] = youTubeId;
    data['rating'] = rating;
    data['views'] = views;
    data['thumbnail'] = thumbnail;
    data['length'] = length;
    return data;
  }
}