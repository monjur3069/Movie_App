import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_tmdb/home/UI/Widgets/homepage_1st_slider.dart';
import 'package:movie_app_tmdb/home/UI/home_usecase/home_usecase.dart';
import 'package:movie_app_tmdb/home/model/now_playing_model.dart';

class NowPlayingBuildLoaded extends StatelessWidget {

  NowPlayingModel model;

  NowPlayingBuildLoaded({Key? key,required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            height: 250.h,

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
}
