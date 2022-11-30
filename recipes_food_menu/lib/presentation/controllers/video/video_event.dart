part of 'video_bloc.dart';

@immutable
abstract class VideoEvent {}

class GetListVideo extends VideoEvent {
  final String? keyword;
  GetListVideo({this.keyword});
}
