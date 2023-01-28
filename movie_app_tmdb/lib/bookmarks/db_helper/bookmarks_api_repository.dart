
import '../model/bookmarks_model.dart';
import 'bookmarks_api_fetch.dart';


class BookmarksApiRepository {
  final _bookmarksProvider = BookmarksApiProvider();

  Future<BookmarksModel> fetchBookmarksMovieList(String? id) {
    return _bookmarksProvider.fetchBookmarksMovieList(id);
  }

}

class BookmarksNetworkError extends Error {}
