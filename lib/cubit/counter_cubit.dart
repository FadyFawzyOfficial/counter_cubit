import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

//! Every Cubit is given a 'state' variable and an emit function that emits a new
//! 'state' to a Stream.
class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.initial());

  void increment() {
    final newState = state.copyWith(counter: state.counter + 1);
    print(newState);
    emit(newState);
  }

  void decrement() {
    final newState = state.copyWith(counter: state.counter - 1);
    print(newState);
    emit(newState);
  }
}
