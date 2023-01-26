import 'package:equatable/equatable.dart';

abstract class MovieEvent extends Equatable{
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class GetMovieList extends MovieEvent {}