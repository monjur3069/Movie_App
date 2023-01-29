import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_tmdb/details/UI/usecase/details_usecase.dart';
import 'package:movie_app_tmdb/details/model/details_model.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

class DetailsLoaded extends StatelessWidget {
  DetailsModel model;
  DetailsLoaded({required this.model,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final image = 'https://image.tmdb.org/t/p/w500${model.posterPath!}';
    final title = model.title!;
    final rating = model.voteAverage!.toString();
    final time = durationToString(model.runtime);

    bool isTrue = false;


    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Image.network('https://image.tmdb.org/t/p/w500${model.posterPath!}'),
          Positioned(
            bottom: 0,
            child: Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: Colors.white,
                ),
                child: Padding(
                  padding:
                  const EdgeInsets.only(left: 16.0, top: 16, right: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            model.title!,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.sp),
                          ),
                          IconButton(
                              onPressed: () => insertData(context, model.id!.toString(),image,title,rating,time,model.genres!),
                              icon: Icon(Icons.bookmark))
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.deepOrange,
                          ),
                          Text(
                            model.voteAverage!.toString() + '/10  IMDb',
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                          height: 20.h,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: model.genres!.length,
                              itemBuilder: (context, index) {
                                return OutlinedButton(
                                    onPressed: () {},
                                    child: Text(model.genres![index].name!));
                              })),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Length'),
                              Text(durationToString(model.runtime))
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Language'),
                              Text(model.spokenLanguages![0].englishName!)
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [Text('Rating'), Text('PG-13')],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Description',
                        style: TextStyle(
                            fontSize: 22.sp, color: Color(0xFF000A3D)),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(model.overview!)
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}


Widget _detailsLoaded(BuildContext context, DetailsModel model) {

  final image = 'https://image.tmdb.org/t/p/w500${model.posterPath!}';
  final title = model.title!;
  final rating = model.voteAverage!.toString();
  final time = durationToString(model.runtime);

  bool isTrue = false;


  return Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    child: Stack(
      children: [
        Image.network('https://image.tmdb.org/t/p/w500${model.posterPath!}'),
        Positioned(
          bottom: 0,
          child: Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: Colors.white,
              ),
              child: Padding(
                padding:
                const EdgeInsets.only(left: 16.0, top: 16, right: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          model.title!,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.sp),
                        ),
                        IconButton(
                            onPressed: () => insertData(context, model.id!.toString(),image,title,rating,time,model.genres!),
                            icon: Icon(Icons.bookmark))
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.deepOrange,
                        ),
                        Text(
                          model.voteAverage!.toString() + '/10  IMDb',
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    SizedBox(
                        height: 20.h,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: model.genres!.length,
                            itemBuilder: (context, index) {
                              return OutlinedButton(
                                  onPressed: () {},
                                  child: Text(model.genres![index].name!));
                            })),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Length'),
                            Text(durationToString(model.runtime))
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Language'),
                            Text(model.spokenLanguages![0].englishName!)
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [Text('Rating'), Text('PG-13')],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Description',
                      style: TextStyle(
                          fontSize: 22.sp, color: Color(0xFF000A3D)),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(model.overview!)
                  ],
                ),
              )),
        ),
      ],
    ),
  );
}