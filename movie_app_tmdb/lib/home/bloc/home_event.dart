import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable{
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetNowPlayingMovieList extends HomeEvent {}



abstract class Home1Event extends Equatable{
  const Home1Event();

  @override
  List<Object> get props => [];
}

class GetPopularMovieList extends Home1Event {}