import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BookmarksWidget extends StatefulWidget {

  String title;
  String img;
  num rating;
  String length;
  List<String> geners;

  BookmarksWidget({
    required this.title,
    required this.img,
    required this.rating,
    required this.geners,
    required this.length,
    Key? key,
  }) : super(key: key,);

  @override
  State<BookmarksWidget> createState() => _BookmarksWidgetState();
}

class _BookmarksWidgetState extends State<BookmarksWidget> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: InkWell(
        onTap: (){},
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10,),
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
                    height: 160.h,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 140.h,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16),
                                  )),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 6.0,top: 8.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [

                                      ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(16),
                                        ),
                                        child: Image.network(
                                          widget.img,
                                          height:
                                          120.h,
                                          width: 90.w,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(width: 10.w,),
                                      Container(
                                        width: MediaQuery.of(context).size.width * .52,
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
                                            SizedBox(
                                              height: 8.h,
                                            ),
                                            //Outline Button
                                            SizedBox(
                                              height: 25.h,
                                              width: 160.w,
                                              child: ListView.builder(
                                                  scrollDirection: Axis.horizontal,
                                                  itemCount: widget.geners.length -1,
                                                  itemBuilder: (context,index){
                                                    return OutlinedButton(
                                                        onPressed: () {},
                                                        child: Text(widget.geners[index]));
                                                  }),
                                            ),
                                            SizedBox(
                                              height: 8.h,
                                            ),
                                            //time length
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Icon(Icons.lock_clock),
                                                SizedBox(width: 5.w,),
                                                Text(
                                                  widget.length,
                                                  style: TextStyle(fontSize: 12.sp,),

                                                ),
                                              ],
                                            ),


                                          ],
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: (){},
                                          icon: const Icon(Icons.delete,color: Colors.red,size: 40,)),

                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 5.h,)
                        ],
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
