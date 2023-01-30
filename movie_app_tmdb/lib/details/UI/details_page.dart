import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_tmdb/details/bloc/details_bloc.dart';
import 'package:movie_app_tmdb/details/bloc/details_event.dart';
import 'package:movie_app_tmdb/details/bloc/details_state.dart';
import 'package:movie_app_tmdb/details/widgets/details_widgets.dart';


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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
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
              return const Loading();
            } else if (state is DetailsLoading) {
              return const Loading();
            } else if (state is DetailsModelLoaded) {
              return DetailsLoaded(model: state.details,);
            } else if (state is DetailsError) {
              return Container();
            } else {
              return Container();
            }
          }),
        ),
      ),
    );
  }

}
