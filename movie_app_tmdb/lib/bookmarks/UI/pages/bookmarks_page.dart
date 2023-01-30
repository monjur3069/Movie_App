import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_tmdb/home/UI/home_usecase/home_usecase.dart';
import 'package:movie_app_tmdb/local_db/db_helper.dart';

import '../../../local_db_model/local_db_model.dart';
import '../Widgets/bookmarks_widget.dart';

class BookmarksPage extends StatefulWidget {
  const BookmarksPage({Key? key}) : super(key: key);

  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

Future<List<LocalDBModel>> fetchData() async {
  return await DBHelper.getAllMovieDetails();
}

class _BookmarksPageState extends State<BookmarksPage> {

  late var split;

  @override
  void initState() {
    split = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Color(0xebffffff),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 10,
            ),
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.r)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 5.h),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.r)),
                    height: 120.h,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: Center(
                      child: FutureBuilder(
                          future: fetchData(),
                          builder: (context,
                              AsyncSnapshot<List<LocalDBModel>> snapshot) {
                            if (snapshot.hasData) {

                              return ListView.builder(
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index) {
                                    split = snapshot.data![index].geners!.split(',');
                                    return BookmarksWidget(
                                        title: snapshot.data![index].title!,
                                        img: snapshot.data![index].image!,
                                        rating: snapshot.data![index].rating!,
                                        geners: split,
                                        length: snapshot.data![index].time!);
                                  });
                            }
                            return Text('data');
                          }),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
