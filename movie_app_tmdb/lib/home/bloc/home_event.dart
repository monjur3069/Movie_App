import 'package:equatable/equatable.dart';

abstract class HomeNowPlayingEvent extends Equatable{
  const HomeNowPlayingEvent();

  @override
  List<Object> get props => [];
}

class GetNowPlayingMovieList extends HomeNowPlayingEvent {}



abstract class HomePopularEvent extends Equatable{
  const HomePopularEvent();

  @override
  List<Object> get props => [];
}

class GetPopularMovieList extends HomePopularEvent {}