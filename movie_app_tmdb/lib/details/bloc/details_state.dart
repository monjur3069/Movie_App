
import 'package:equatable/equatable.dart';

import '../model/details_model.dart';


abstract class DetailsState extends Equatable {
  const DetailsState();

  @override
  List<Object?> get props => [];
}

class DetailsInitial extends DetailsState {}

class DetailsLoading extends DetailsState {}

class DetailsModelLoaded extends DetailsState {
  final DetailsModel details;
  const DetailsModelLoaded(this.details);
}

class DetailsError extends DetailsState {
  final String? message;
  const DetailsError(this.message);
}