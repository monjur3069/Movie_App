
import '../model/details_model.dart';
import 'details_api_fetch.dart';


class DetailsApiRepository {
  final _detailsProvider = DetailsApiProvider();

  Future<DetailsModel> fetchDetailsMovieList(String? id) {
    return _detailsProvider.fetchDetailsMovieList(id);
  }

}

class DetailsNetworkError extends Error {}
