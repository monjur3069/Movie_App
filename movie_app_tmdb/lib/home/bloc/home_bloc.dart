import 'package:bloc/bloc.dart';
import '../db_helper/homepage_api/home_api_repository.dart';
import 'home_event.dart';
import 'home_state.dart';


class HomeNowPlayingBloc extends Bloc<HomeNowPlayingEvent, HomeNowPlayingState> {
  HomeNowPlayingBloc() : super(HomeNowPlayingInitial()) {
    final HomeApiRepository _apiRepository = HomeApiRepository();

    on<GetNowPlayingMovieList>((event, emit) async {
      try {
        emit(HomeNowPlayingLoading());
        final npList = await _apiRepository.fetchNowPlayingMovieList();
        emit(NowPlayingModelLoaded(npList));
        if (npList.error != null) {
          emit(HomeNowPlayingError(npList.error));
        }
      } on HomeNowPlayingNetworkError {
        emit(const HomeNowPlayingError("Failed to fetch data. is your device online?"));
      }
    });

  }
}


class HomePopularBloc extends Bloc<HomePopularEvent, HomePopularState> {
  HomePopularBloc() : super(HomePopularInitial()) {
    final HomeApiRepository _apiRepository = HomeApiRepository();

    on<GetPopularMovieList>((event, emit) async{
      try {
        emit(HomePopularLoading());
        final pList = await _apiRepository.fetchPopularMovieList();
        emit(PopularModelLoaded(pList));
        if (pList.error != null) {
          emit(HomePopularError(pList.error));
        }
      } on HomeNowPlayingNetworkError {
        emit(const HomePopularError("Failed to fetch data. is your device online?"));
      }
    });
  }
}

