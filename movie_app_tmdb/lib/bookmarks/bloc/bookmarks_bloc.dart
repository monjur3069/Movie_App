import 'package:bloc/bloc.dart';
import '../db_helper/bookmarks_api_repository.dart';
import 'bookmarks_event.dart';
import 'bookmarks_state.dart';


class BookmarksBloc extends Bloc<BookmarksEvent, BookmarksState> {
  BookmarksBloc(String? id) : super(BookmarksInitial()) {
    final BookmarksApiRepository _apiRepository = BookmarksApiRepository();

    on<GetBookmarksMovieList>((event, emit) async {
      try {
        emit(BookmarksLoading());
        final npList = await _apiRepository.fetchBookmarksMovieList(id);
        emit(BookmarksModelLoaded(npList));
        if (npList.error != null) {
          emit(BookmarksError(npList.error));
        }
      } on BookmarksNetworkError {
        emit(const BookmarksError("Failed to fetch data. is your device online?"));
      }
    });

  }
}

