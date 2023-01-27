import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_tmdb/details/bloc/details_bloc.dart';
import 'package:movie_app_tmdb/details/bloc/details_event.dart';
import 'package:movie_app_tmdb/details/bloc/details_state.dart';
import 'package:movie_app_tmdb/details/model/details_model.dart';

class DetailsPage extends StatefulWidget {

  static const String routeName = '/detailspage';

  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  final DetailsBloc _detailsBloc = DetailsBloc();

  @override
  void initState() {
    _detailsBloc.add(GetDetailsMovieList());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: BlocProvider(
          create: (_) => _detailsBloc,
          child: BlocListener<DetailsBloc, DetailsState>(
              listener: (context, state) {
                if (state is DetailsError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message!)));
                }
              },
              child: BlocBuilder<DetailsBloc, DetailsState > (
              builder: (context, state){
                if(state is DetailsInitial)
                  {
                    return _detailsLoading();
                  }
                else if(state is DetailsLoading)
                  {
                    return _detailsLoading();
                  }
                else if(state is DetailsModelLoaded)
                  {
                    return _detailsLoaded(context, state.details);
                  }
                else if(state is DetailsError)
                  {
                    return Container();
                  }
                else
                  {
                    return Container();
                  }

          }
          ),
        ),
      ),
    ),);
  }

  Widget _detailsLoading() {
    return const Center(child: CircularProgressIndicator(),);
  }

  Widget _detailsLoaded(BuildContext context, DetailsModel model) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Image.network('https://image.tmdb.org/t/p/w500${model.posterPath!}'),
          Positioned(
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height/2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: Colors.white,
              ),
              child: Text('Hello'),
            ),
          ),
          Positioned(bottom:0,child: Text('Hello'))
        ],
      ),
    );
  }



}
