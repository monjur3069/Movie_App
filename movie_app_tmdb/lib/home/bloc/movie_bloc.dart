import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


import '../resources/api_repository.dart';
import 'movie_event.dart';
import 'movie_state.dart';


class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetMovieList>((event, emit) async {
      try {
        emit(MovieLoading());
        final mList = await _apiRepository.fetchPopularMovieList();
        emit(MovieLoaded(mList));
        if (mList.error != null) {
          emit(MovieError(mList.error));
        }
      } on NetworkError {
        emit(const MovieError("Failed to fetch data. is your device online?"));
      }
    });
  }
}
