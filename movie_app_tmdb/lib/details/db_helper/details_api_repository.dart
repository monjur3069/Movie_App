
import '../model/details_model.dart';
import 'details_api_fetch.dart';


class DetailsApiRepository {
  final _detailsProvider = DetailsApiProvider();

  Future<DetailsModel> fetchDetailsMovieList() {
    return _detailsProvider.fetchDetailsMovieList();
  }

}

class DetailsNetworkError extends Error {}
