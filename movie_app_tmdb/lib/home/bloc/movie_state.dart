
import 'package:equatable/equatable.dart';

import '../model/poular_model.dart';


abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object?> get props => [];
}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final PopularModel movieModel;
  const MovieLoaded(this.movieModel);
}

class MovieError extends MovieState {
  final String? message;
  const MovieError(this.message);
}