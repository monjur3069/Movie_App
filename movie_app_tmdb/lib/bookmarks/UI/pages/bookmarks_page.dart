import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Widgets/bookmarks_widget.dart';

class BookmarksPage extends StatefulWidget {
  const BookmarksPage({Key? key}) : super(key: key);

  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xebffffff),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10,),
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.r)
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height:5.h),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.r)
                    ),
                    height: 120.h,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return InkWell(
                            child: BookmarksWidget(
                                title: 'Banta',
                                img:
                                'https://image.tmdb.org/t/p/w500/wgHh8tMYtMNXiEoJd5TgbZCX3VE.jpg',
                                rating: 8.5, geners: ['Animation','Action','Adventure','Comedy'], length: '01h 43min',
                            ),
                            onTap: () {},
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
