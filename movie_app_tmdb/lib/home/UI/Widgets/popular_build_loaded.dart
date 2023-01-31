import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_tmdb/home/UI/Widgets/homepage_1st_slider.dart';
import 'package:movie_app_tmdb/home/UI/home_usecase/home_usecase.dart';
import 'package:movie_app_tmdb/home/model/poular_model.dart';

import 'homepage_2nd_slider.dart';

class PopularBuildLoaded extends StatelessWidget {

  PopularModel model;

  PopularBuildLoaded({Key? key,required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
