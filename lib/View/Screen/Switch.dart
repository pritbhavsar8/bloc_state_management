import 'package:bloc_state_management/bloc/switch_bloc/bloc/switch_bloc.dart';
import 'package:bloc_state_management/bloc/switch_bloc/bloc/switch_event.dart';
import 'package:bloc_state_management/bloc/switch_bloc/bloc/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchExample extends StatefulWidget {
  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Row(
          children: [
            Text("Notification"),
            BlocBuilder<SwitchBloc, SwitchState>(
              builder: (context, state) {
                return Switch(
                  value: state.isSwitch,
                  onChanged: (value) {
                    context.read<SwitchBloc>().add(SwitchOnandOff());
                  },
                );
              },
            )
          ],
        ),
        SizedBox(height: 20.0),
        BlocBuilder<SwitchBloc, SwitchState>(
          builder: (context, state) {
            return Container(
              width: 100.0,
              height: 100.0,
              color: Colors.red.withOpacity(state.slider),
            );
          },
        ),
        BlocBuilder<SwitchBloc, SwitchState>(
          builder: (context, state) {
            return Slider(
              value: state.slider,
              onChanged: (value) {
                context.read<SwitchBloc>().add(sliderEvent(slider: value));
              },
            );
          },
        )
      ]),
    );
  }
}
