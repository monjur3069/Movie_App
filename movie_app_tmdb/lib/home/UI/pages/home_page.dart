import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../bloc/home_bloc.dart';
import '../../bloc/home_event.dart';
import '../../bloc/home_state.dart';
import '../../db_helper/db.dart';
import '../../model/now_playing_model.dart';
import '../Widgets/build_widget.dart';
import '../Widgets/dashboard_1st_slider.dart';
import '../Widgets/dashboard_2nd_slider.dart';
import '../Widgets/dashboard_drawer.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/homepage';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>(); //Used for opening drawer
  var searchController = TextEditingController();

  final HomeBloc _movieBloc = HomeBloc();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _movieBloc.add(GetNowPlayingMovieList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
      drawer: DashBoardDrawer(),
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
        child: BlocProvider(
          create: (_) => _movieBloc,
          child: BlocListener<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state is HomeError) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message!)));
              }
            },
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeInitial) {
                  return _buildLoading();
                } else if (state is HomeLoading) {
                  return _buildLoading();
                } else if (state is NowPlayingModelLoaded) {
                  return _nowPlayingBuildLoaded(context,state.nowPlaying);
                } else if (state is HomeError) {
                  return Container();
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _nowPlayingBuildLoaded(BuildContext context, NowPlayingModel model,) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0.w, right: 5.w),
      child: Column(
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
                  onTap: () {},
                );
              },
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
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
          SizedBox(
            height: 10.h,
          ),
          //Second Slider
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
                    onTap: () {},
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
