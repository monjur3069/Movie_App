
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
  final NowPlayingModel nowPlayingModel;
  const NowPlayingModelLoaded(this.nowPlayingModel);
}

class HomeError extends HomeState {
  final String? message;
  const HomeError(this.message);
}



//Second State

abstract class Home1State extends Equatable {
  const Home1State();

  @override
  List<Object?> get props => [];
}

class Home1Initial extends Home1State {}

class Home1Loading extends Home1State {}

class PopularModelLoaded extends Home1State{
  final PopularModel popular;
  const PopularModelLoaded(this.popular);
}

class Home1Error extends Home1State {
  final String? message;
  const Home1Error(this.message);
}


