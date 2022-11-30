part of 'video_bloc.dart';

@immutable
abstract class VideoState {}

class VideoInitial extends VideoState {}

class VideoLoading extends VideoState {}

class VideoSuccess extends VideoState {
  final List<VideoEntity>? listVideo;
  VideoSuccess({this.listVideo});
}

class VideoError extends VideoState {
  final String? message;
  VideoError({this.message});
}

class VideoNoConnection extends VideoState {}
