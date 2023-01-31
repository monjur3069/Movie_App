import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_tmdb/details/UI/details_page.dart';
import 'package:movie_app_tmdb/home/UI/Widgets/nowplaying_build_loaded.dart';
import 'package:movie_app_tmdb/home/UI/Widgets/popular_build_loaded.dart';
import 'package:movie_app_tmdb/home/model/poular_model.dart';
import '../../bloc/home_bloc.dart';
import '../../bloc/home_event.dart';
import '../../bloc/home_state.dart';
import '../Widgets/homepage_2nd_slider.dart';
import '../Widgets/homepage_drawer.dart';
import '../home_usecase/home_usecase.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/homepage';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>(); //Used for opening drawer

  final HomeNowPlayingBloc _homeNowPlayingBloc = HomeNowPlayingBloc();
  final HomePopularBloc _homePopularBloc = HomePopularBloc();


  @override
  void initState() {
    _homeNowPlayingBloc.add(GetNowPlayingMovieList());
    _homePopularBloc.add(GetPopularMovieList());


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
      drawer: HomePageDrawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white70,
        leading: IconButton(
            icon: Icon(Icons.menu),
            color: Colors.deepOrange,
            onPressed: () {
              scaffoldKey.currentState?.openDrawer();
            }),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_none_outlined),
            color: Colors.black,
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300.h,
                child: BlocProvider(
                  create: (_) => _homeNowPlayingBloc,
                  child: BlocListener<HomeNowPlayingBloc, HomeNowPlayingState>(
                    listener: (context, state) {
                      if (state is HomeNowPlayingError) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(state.message!)));
                      }
                    },
                    child: BlocBuilder<HomeNowPlayingBloc, HomeNowPlayingState>(
                      builder: (context, state) {
                        if (state is HomeNowPlayingInitial) {
                          return _buildLoading();
                        }
                        else if (state is HomeNowPlayingLoading) {
                          return _buildLoading();
                        } else if (state is NowPlayingModelLoaded) {
                          return NowPlayingBuildLoaded(model:state.nowPlayingModel);
                        } else if (state is HomeNowPlayingError) {
                          return Container();
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h,),
              SizedBox(
                height: 300.h,
                child: BlocProvider(
                  create: (_) => _homePopularBloc,
                  child: BlocListener<HomePopularBloc, HomePopularState>(
                    listener: (context, state) {
                      if (state is HomePopularError) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(state.message!)));
                      }
                    },
                    child: BlocBuilder<HomePopularBloc, HomePopularState>(
                      builder: (context, state) {
                        if (state is HomePopularInitial) {
                          return _buildLoading();
                        }if(state is PopularModelLoaded){
                          return PopularBuildLoaded(model: state.popular);
                        }
                        else if (state is HomePopularLoading) {
                          return _buildLoading();
                        } else if (state is HomePopularError) {
                          return Container();
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(child: CircularProgressIndicator());
  }


}

