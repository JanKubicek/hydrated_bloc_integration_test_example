import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

abstract class MainEvent {}

class Increment extends MainEvent {}

class Decrement extends MainEvent {}

class MainBloc extends HydratedBloc<MainEvent, int> {
  MainBloc() : super(0) {
    on<Increment>((event, emit) => emit(state + 1));
    on<Decrement>((event, emit) => emit(state - 1));
  }

  @override
  int? fromJson(Map<String, dynamic> json) {
    return json['counter'];
  }

  @override
  Map<String, dynamic>? toJson(int state) {
    return {'counter': state};
  }
}
