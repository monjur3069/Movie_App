import 'package:equatable/equatable.dart';

abstract class BookmarksEvent extends Equatable{
  const BookmarksEvent();

  @override
  List<Object> get props => [];
}

class GetBookmarksMovieList extends BookmarksEvent {}
