import 'package:bloc/bloc.dart';
import '../db_helper/details_api_repository.dart';
import 'details_event.dart';
import 'details_state.dart';


class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc(String? id) : super(DetailsInitial()) {
    final DetailsApiRepository _apiRepository = DetailsApiRepository();

    on<GetDetailsMovieList>((event, emit) async {
      try {
        emit(DetailsLoading());
        final npList = await _apiRepository.fetchDetailsMovieList(id);
        emit(DetailsModelLoaded(npList));
        if (npList.error != null) {
          emit(DetailsError(npList.error));
        }
      } on DetailsNetworkError {
        emit(const DetailsError("Failed to fetch data. is your device online?"));
      }
    });

  }
}

