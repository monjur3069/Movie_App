
import 'package:equatable/equatable.dart';

import '../model/now_playing_model.dart';
import '../model/poular_model.dart';


abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class NowPlayingModelLoaded extends HomeState {
  final NowPlayingModel nowPlaying;
  const NowPlayingModelLoaded(this.nowPlaying);
}
class PopularModelLoaded extends HomeState{
  final PopularModel popular;
  const PopularModelLoaded(this.popular);
}

class HomeError extends HomeState {
  final String? message;
  const HomeError(this.message);
}