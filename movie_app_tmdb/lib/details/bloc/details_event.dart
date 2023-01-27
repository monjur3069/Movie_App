import 'package:equatable/equatable.dart';

abstract class DetailsEvent extends Equatable{
  const DetailsEvent();

  @override
  List<Object> get props => [];
}

class GetDetailsMovieList extends DetailsEvent {}
