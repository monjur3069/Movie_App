import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Utils/constants.dart';

class DashBoardFirstSlider extends StatefulWidget {

  String title;
  String img;
  num rating;


  DashBoardFirstSlider({
    required this.title,
    required this.img,
    required this.rating,
    Key? key,
  }) : super(key: key,);

  @override
  State<DashBoardFirstSlider> createState() => _DashBoardFirstSliderState();
}

class _DashBoardFirstSliderState extends State<DashBoardFirstSlider> {

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            width: 200.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                )),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
              child: Image.network(
                widget.img,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
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
    );
  }
}
