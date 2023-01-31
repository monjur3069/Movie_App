import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_tmdb/bookmarks/UI/bookmarks_usecase/bookmarks_usecase.dart';
import 'package:movie_app_tmdb/home/UI/home_usecase/home_usecase.dart';
import 'package:movie_app_tmdb/local_db/db_helper.dart';

import '../../../local_db_model/local_db_model.dart';


class BookmarksPage extends StatefulWidget {
  List<LocalDBModel> model;

  BookmarksPage({Key? key, required this.model}) : super(key: key);

  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

Future<List<LocalDBModel>> fetchData() async {
  return await DBHelper.getAllMovieDetails();
}

class _BookmarksPageState extends State<BookmarksPage> {
  late var split;
  late List<LocalDBModel> copyModel;

  @override
  void initState() {
    split = [];
    copyModel = widget.model;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xebffffff),
      body: SafeArea(
          child: ListView.builder(
              itemCount: copyModel.length,
              itemBuilder: (context, index) {
                split = copyModel[index].geners!.split(',');
                return InkWell(
                  onTap: () => detailsPage(
                      context, copyModel[index].mid!.toString()),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.r)),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.r)),
                          height: 160.h,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    width:
                                    MediaQuery.of(context).size.width,
                                    height: 160.h,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(16),
                                        )),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 6.0, top: 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                              const BorderRadius.all(
                                                Radius.circular(16),
                                              ),
                                              child: Image.network(
                                                copyModel[index].image!,
                                                height: 120.h,
                                                width: 90.w,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Container(
                                              width:
                                              MediaQuery.of(context)
                                                  .size
                                                  .width *
                                                  .52,
                                              child: Column(
                                                mainAxisSize:
                                                MainAxisSize.min,
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .start,
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .start,
                                                children: [
                                                  Text(
                                                    copyModel[index]
                                                        .title!,
                                                    style: TextStyle(
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                        FontWeight
                                                            .w700),
                                                  ),
                                                  SizedBox(
                                                    height: 8.h,
                                                  ),
                                                  //star icon
                                                  SizedBox(
                                                    width: 180.w,
                                                    child: Row(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            const Icon(
                                                              Icons.star,
                                                              color: Colors
                                                                  .deepOrange,
                                                            ),
                                                            Text(
                                                              '${copyModel[index].rating!}/10  IMDb',
                                                              style: TextStyle(
                                                                  fontSize: 14
                                                                      .sp,
                                                                  fontWeight:
                                                                  FontWeight.w400),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 8.h,
                                                  ),
                                                  //Outline Button
                                                  SizedBox(
                                                    height: 25.h,
                                                    width: 160.w,
                                                    child:
                                                    ListView.builder(
                                                        scrollDirection:
                                                        Axis
                                                            .horizontal,
                                                        itemCount:
                                                        split.length -
                                                            1,
                                                        itemBuilder:
                                                            (context,
                                                            index) {
                                                          return OutlinedButton(
                                                              onPressed:
                                                                  () {},
                                                              child: Text(
                                                                  split[index]));
                                                        }),
                                                  ),
                                                  SizedBox(
                                                    height: 8.h,
                                                  ),
                                                  //time length
                                                  Row(
                                                    mainAxisSize:
                                                    MainAxisSize.min,
                                                    children: [
                                                      const Icon(Icons
                                                          .lock_clock),
                                                      SizedBox(
                                                        width: 5.w,
                                                      ),
                                                      Text(
                                                        copyModel[index]
                                                            .time!,
                                                        style: TextStyle(
                                                          fontSize: 12.sp,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            IconButton(
                                                onPressed: () async {
                                                  await deleteItemFromMovieList(
                                                      context,
                                                      copyModel[index]
                                                          .mid!);
                                                  copyModel = await DBHelper
                                                      .getAllMovieDetails();
                                                  setState(() {});
                                                },
                                                icon: const Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                  size: 40,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              })),
    );
  }
}
