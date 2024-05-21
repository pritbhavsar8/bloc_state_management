import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/bloc/switch_bloc/bloc/switch_event.dart';
import 'package:bloc_state_management/bloc/switch_bloc/bloc/switch_state.dart';
import 'package:equatable/equatable.dart';


class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchState()) {
     on<SwitchOnandOff>(Switch);
     on<sliderEvent>(slider);
  }
  void Switch (SwitchOnandOff event , Emitter<SwitchState> emit){
    emit(state.copyWith(isSwitch: !state.isSwitch));

  }
   void slider (sliderEvent event , Emitter<SwitchState> emit){
    emit(state.copyWith(slider: event.slider.toDouble()));
  }
}
