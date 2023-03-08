import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/constants.dart';



class DashBoardSecondSlider extends StatefulWidget {

  String title;
  String img;
  num rating;

  DashBoardSecondSlider({
    required this.title,
    required this.img,
    required this.rating,
    Key? key,
  }) : super(key: key,);

  @override
  State<DashBoardSecondSlider> createState() => _DashBoardSecondSliderState();
}

class _DashBoardSecondSliderState extends State<DashBoardSecondSlider> {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: 100.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  )),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                      child: FadeInImage.assetNetwork(
                        fit: BoxFit.cover,
                        height: 100.h,
                        width: 100.w,
                        placeholder: "images/spinner.gif",
                        image: widget.img,
                        imageErrorBuilder: (c, o, s) => Image.asset(
                          "images/image_not_found.png",
                          fit: BoxFit.cover,
                          height: 150.h,
                          width: 150.w,
                        ),
                      )
                      /*Image.network(
                        widget.img,
                        height:
                        100.h,
                        width: 100.w,
                        fit: BoxFit.cover,
                      )*/,
                    ),
                    SizedBox(width: 10.w,),
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          SizedBox(
                            width: 200.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.deepOrange,
                                    ),
                                    Text(
                                      widget.rating.toString()+'/10  IMDb',
                                      style: TextStyle(
                                          fontSize: 14.sp, fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    )

                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 5.h,)
        ],
      ),
    );
  }
}
