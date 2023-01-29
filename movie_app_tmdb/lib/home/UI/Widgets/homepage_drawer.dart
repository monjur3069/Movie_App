import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_tmdb/home/UI/pages/home_drawer.dart';

import '../home_usecase/home_usecase.dart';

class HomePageDrawer extends StatelessWidget {
  const HomePageDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xff343333),
      child: Padding(
        padding: const EdgeInsets.only(left: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200.h,
            ),
            InkWell(
                onTap: () {},
                child: Text(
                  'Home',
                  style: TextStyle(
                      fontSize: 22.h,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
            SizedBox(
              height: 10,
            ),
            InkWell(
                onTap: () => bookmarksPage(context),
                child: Text(
                  'Bookmarks',
                  style: TextStyle(
                      fontSize: 22.h,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }

}
