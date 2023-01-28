import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_tmdb/details/UI/details_page.dart';
import 'package:movie_app_tmdb/home/model/poular_model.dart';
import '../../bloc/home_bloc.dart';
import '../../bloc/home_event.dart';
import '../../bloc/home_state.dart';
import '../../db_helper/db.dart';
import '../../model/now_playing_model.dart';
import '../Widgets/build_widget.dart';
import '../Widgets/homepage_1st_slider.dart';
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
        child: Column(
          children: [
            BlocProvider(
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
                      return _nowPlayingBuildLoaded(context,state.nowPlayingModel);
                    } else if (state is HomeNowPlayingError) {
                      return Container();
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            Expanded(
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
                        return _popularBuildLoaded(context, state.popular);
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
    );
  }

  Widget _buildLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _nowPlayingBuildLoaded(BuildContext context, NowPlayingModel model) {

    return Padding(
      padding: EdgeInsets.only(left: 16.0.w, right: 5.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Now, ',
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Showing',
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'View All',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(width: 2)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          //First Slider
          Container(
            height: 200.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: model.results!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  child: Row(
                    children: [
                      DashBoardFirstSlider(
                        title: model.results![index].title!,
                        img:
                        'https://image.tmdb.org/t/p/w500${model.results![index].posterPath}',
                        rating: model.results![index].voteAverage!,
                      ),
                      SizedBox(
                        width: 7.w,
                      ),
                    ],
                  ),
                  onTap: () => detailsPage(context,model.results![index].id.toString()),
                );
              },
            ),
          ),

        ],
      ),
    );
  }
  Widget _popularBuildLoaded(BuildContext context, PopularModel model,) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0.w, right: 5.w),
      child: Column(
        children: [
          //Second Slider
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Popular',
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'View All',
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.w600),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(width: 2)),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                ],
              )
            ],
          ),
          Expanded(
            child: Container(
              height: 50.h,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: model.results!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: DashBoardSecondSlider(
                        title: model.results![index].title!,
                        img:
                        'https://image.tmdb.org/t/p/w500${model.results![index].posterPath}',
                        rating: model.results![index].voteAverage!),
                    onTap: () => detailsPage(context,model.results![index].id.toString()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

}

