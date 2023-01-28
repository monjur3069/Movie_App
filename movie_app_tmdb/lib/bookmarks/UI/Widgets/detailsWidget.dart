import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DetailsWidget extends StatefulWidget {

  String title;
  String img;
  num rating;

  DetailsWidget({
    required this.title,
    required this.img,
    required this.rating,
    Key? key,
  }) : super(key: key,);

  @override
  State<DetailsWidget> createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {


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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                      child: Image.network(
                        widget.img,
                        height:
                        100.h,
                        width: 100.w,
                        fit: BoxFit.cover,
                      ),
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
                    ),
                    IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.delete,color: Colors.red,size: 40,))

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
