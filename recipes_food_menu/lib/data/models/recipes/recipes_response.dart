import 'result.dart';

class RecipesResponse {
  List<Result>? results;
  String? baseUri;
  int? offset;
  int? number;
  int? totalResults;
  int? processingTimeMs;
  int? expires;

  RecipesResponse({
    this.results,
    this.baseUri,
    this.offset,
    this.number,
    this.totalResults,
    this.processingTimeMs,
    this.expires,
  });

  factory RecipesResponse.fromJson(Map<String, dynamic> json) {
    return RecipesResponse(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
      baseUri: json['baseUri'] as String?,
      offset: json['offset'] as int?,
      number: json['number'] as int?,
      totalResults: json['totalResults'] as int?,
      processingTimeMs: json['processingTimeMs'] as int?,
      expires: json['expires'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'results': results?.map((e) => e.toJson()).toList(),
        'baseUri': baseUri,
        'offset': offset,
        'number': number,
        'totalResults': totalResults,
        'processingTimeMs': processingTimeMs,
        'expires': expires,
      };
}
