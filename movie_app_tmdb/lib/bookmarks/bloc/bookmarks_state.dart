
import 'package:equatable/equatable.dart';

import '../model/bookmarks_model.dart';


abstract class BookmarksState extends Equatable {
  const BookmarksState();

  @override
  List<Object?> get props => [];
}

class BookmarksInitial extends BookmarksState {}

class BookmarksLoading extends BookmarksState {}

class BookmarksModelLoaded extends BookmarksState {
  final BookmarksModel bookmarksModel;
  const BookmarksModelLoaded(this.bookmarksModel);
}

class BookmarksError extends BookmarksState {
  final String? message;
  const BookmarksError(this.message);
}