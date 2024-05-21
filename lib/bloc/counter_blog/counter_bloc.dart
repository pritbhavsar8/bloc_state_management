import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/bloc/counter_blog/counter_event.dart';
import 'package:bloc_state_management/bloc/counter_blog/counter_state.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  // create constructor
  CounterBloc() : super(CounterState()) {
    on<IncrementCounter>(increment);
    on<DecrementCounter>(decrement);


  }
  void increment(IncrementCounter event,Emitter<CounterState> emit){
    emit(state.copyWith(counter:state.counter + 1));

  }
  void decrement(DecrementCounter event,Emitter<CounterState> emit){
    emit(state.copyWith(counter:state.counter - 1));

  }
}
