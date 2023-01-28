
import 'package:equatable/equatable.dart';

import '../model/now_playing_model.dart';
import '../model/poular_model.dart';


abstract class HomeNowPlayingState extends Equatable {
  const HomeNowPlayingState();

  @override
  List<Object?> get props => [];
}

class HomeNowPlayingInitial extends HomeNowPlayingState {}

class HomeNowPlayingLoading extends HomeNowPlayingState {}

class NowPlayingModelLoaded extends HomeNowPlayingState {
  final NowPlayingModel nowPlayingModel;
  const NowPlayingModelLoaded(this.nowPlayingModel);
}

class HomeNowPlayingError extends HomeNowPlayingState {
  final String? message;
  const HomeNowPlayingError(this.message);
}



//Second State

abstract class HomePopularState extends Equatable {
  const HomePopularState();

  @override
  List<Object?> get props => [];
}

class HomePopularInitial extends HomePopularState {}

class HomePopularLoading extends HomePopularState {}

class PopularModelLoaded extends HomePopularState{
  final PopularModel popular;
  const PopularModelLoaded(this.popular);
}

class HomePopularError extends HomePopularState {
  final String? message;
  const HomePopularError(this.message);
}


