class Result {
  int? id;
  String? title;
  int? readyInMinutes;
  int? servings;
  String? sourceUrl;
  String? image;

  Result({
    this.id,
    this.title,
    this.readyInMinutes,
    this.servings,
    this.sourceUrl,
    this.image,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json['id'] as int?,
        title: json['title'] as String?,
        readyInMinutes: json['readyInMinutes'] as int?,
        servings: json['servings'] as int?,
        sourceUrl: json['sourceUrl'] as String?,
        image: json['image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'readyInMinutes': readyInMinutes,
        'servings': servings,
        'sourceUrl': sourceUrl,
        'image': image,
      };
}
