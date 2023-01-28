import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/now_playing_model.dart';
import 'homepage_1st_slider.dart';
import 'homepage_2nd_slider.dart';


class BuildLoading extends StatelessWidget {
  const BuildLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class NowPlayingBuildLoaded extends StatefulWidget {

  const NowPlayingBuildLoaded(NowPlayingModel nowPlaying, {
    Key? key}) : super(key: key);

  @override
  State<NowPlayingBuildLoaded> createState() => _NowPlayingBuildLoadedState();
}

class _NowPlayingBuildLoadedState extends State<NowPlayingBuildLoaded> {
  @override
  Widget build(BuildContext context,) {

    final NowPlayingModel model = NowPlayingModel();

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
                        rating: model.results![index].voteCount!),
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

