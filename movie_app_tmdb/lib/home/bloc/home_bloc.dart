import 'package:bloc/bloc.dart';
import '../db_helper/now_playing/home_api_repository.dart';
import 'home_event.dart';
import 'home_state.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    final HomeApiRepository _apiRepository = HomeApiRepository();

    on<GetNowPlayingMovieList>((event, emit) async {
      try {
        emit(HomeLoading());
        final npList = await _apiRepository.fetchNowShowingMovieList();
        emit(NowPlayingModelLoaded(npList));
        if (npList.error != null) {
          emit(HomeError(npList.error));
        }
      } on HomeNetworkError {
        emit(const HomeError("Failed to fetch data. is your device online?"));
      }
    });

  }
}
class Home1Bloc extends Bloc<Home1Event, Home1State> {
  Home1Bloc() : super(Home1Initial()) {
    final HomeApiRepository _apiRepository = HomeApiRepository();



    on<GetPopularMovieList>((event, emit) async{
      try {
        emit(Home1Loading());
        final pList = await _apiRepository.fetchPopularMovieList();
        emit(PopularModelLoaded(pList));
        if (pList.error != null) {
          emit(Home1Error(pList.error));
        }
      } on HomeNetworkError {
        emit(const Home1Error("Failed to fetch data. is your device online?"));
      }
    });
  }
}

