import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_tmdb/bookmarks/UI/Widgets/bookmarks_widget.dart';
import 'package:movie_app_tmdb/details/bloc/details_bloc.dart';
import 'package:movie_app_tmdb/details/bloc/details_event.dart';
import 'package:movie_app_tmdb/details/bloc/details_state.dart';
import 'package:movie_app_tmdb/details/model/details_model.dart';
import 'package:movie_app_tmdb/local_db/db_helper.dart';
import 'package:movie_app_tmdb/local_db_model/local_db_model.dart';

import '../../home/UI/Widgets/homepage_2nd_slider.dart';

class BookmarksPage extends StatefulWidget {
  String? id ;

  static const String routeName = '/detailspage';

  BookmarksPage(this.id, {super.key});

  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  late DetailsBloc _detailsBloc;
  LocalDBModel localDBModel = LocalDBModel();

  @override
  void initState() {
    _detailsBloc = DetailsBloc(widget.id);
    _detailsBloc.add(GetDetailsMovieList());

    // TODO: implement initState
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
      ),
    );
  }

  Widget _detailsLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _detailsLoaded(BuildContext context, DetailsModel model) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 10,),
        Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.r)
          ),
          child: SizedBox(
            height: 120.h,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: BookmarksWidget(
                        title: model.title!,
                        img:
                        'https://image.tmdb.org/t/p/w500${model.posterPath}',
                        rating: model.voteAverage!),
                    onTap: () {},
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
  String durationToString(num? minutes) {
    var d = Duration(minutes: int.parse(minutes.toString()));
    List<String> parts = d.toString().split(':');
    return '${parts[0].padLeft(2, '0')}h ${parts[1].padLeft(2, '0')}min';
  }
}
