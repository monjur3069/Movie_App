import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/movie_bloc.dart';
import '../bloc/movie_event.dart';
import '../bloc/movie_state.dart';
import '../model/poular_model.dart';


class PopularMoviePage extends StatefulWidget {
  const PopularMoviePage({Key? key}) : super(key: key);

  @override
  State<PopularMoviePage> createState() => _PopularMoviePageState();
}

class _PopularMoviePageState extends State<PopularMoviePage> {
  final MovieBloc _movieBloc = MovieBloc();

  @override
  void initState() {
    _movieBloc.add(GetMovieList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Popular Movie')),
      body: _buildListMovie(),
    );
  }

  Widget _buildListMovie() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _movieBloc,
        child: BlocListener<MovieBloc, MovieState>(
            listener: (context, state) {
          if (state is MovieError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message!)));
          }
        },
        child: BlocBuilder<MovieBloc,MovieState>(
          builder: (context,state){
            if (state is MovieInitial) {
              return _buildLoading();
            } else if (state is MovieLoading) {
              return _buildLoading();
            } else if (state is MovieLoaded) {
              return _buildCard(context, state.movieModel);
            } else if (state is MovieError) {
              return Container();
            } else {
              return Container();
            }
          },
        ),
        ),
      ),
    );
  }
  Widget _buildCard(BuildContext context, PopularModel model) {
    return ListView.builder(
      itemCount: model.results!.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(8.0),
          padding: const  EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color.fromARGB(255, 196, 193, 193),width: 0.5)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 50,
                width: 50,
                child: Image.network('https://image.tmdb.org/t/p/w500${model.results![index].posterPath}'),
              ),
              Text("Country: ${model.results![index].originalTitle}".toUpperCase(),),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}
