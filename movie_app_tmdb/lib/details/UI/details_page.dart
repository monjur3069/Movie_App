import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_tmdb/details/UI/usecase/details_usecase.dart';
import 'package:movie_app_tmdb/details/bloc/details_bloc.dart';
import 'package:movie_app_tmdb/details/bloc/details_event.dart';
import 'package:movie_app_tmdb/details/bloc/details_state.dart';
import 'package:movie_app_tmdb/details/model/details_model.dart';

class DetailsPage extends StatefulWidget {
  String? id;

  static const String routeName = '/detailspage';

  DetailsPage(this.id, {super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late DetailsBloc _detailsBloc;

  @override
  void initState() {
    _detailsBloc = DetailsBloc(widget.id);
    _detailsBloc.add(GetDetailsMovieList());
    // TODO: implement initState
    super.initState();
  }

/*  @override
  void didChangeDependencies() {
    id = ModalRoute.of(context)!.settings.arguments as String;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: BlocProvider(
          create: (_) => _detailsBloc,
          child: BlocListener<DetailsBloc, DetailsState>(
            listener: (context, state) {
              if (state is DetailsError) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message!)));
              }
            },
            child: BlocBuilder<DetailsBloc, DetailsState>(
                builder: (context, state) {
              if (state is DetailsInitial) {
                return _detailsLoading();
              } else if (state is DetailsLoading) {
                return _detailsLoading();
              } else if (state is DetailsModelLoaded) {
                return _detailsLoaded(context, state.details);
              } else if (state is DetailsError) {
                return Container();
              } else {
                return Container();
              }
            }),
          ),
        ),
      ),
    );
  }

  Widget _detailsLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
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
                              onPressed: () => insertData(context, widget.id,image,title,rating,time,model.genres!),
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
