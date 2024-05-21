
import 'package:bloc_state_management/Model/post.dart';
import 'package:equatable/equatable.dart';

class ApiState extends Equatable{

  List<post> alldata;
  String message;

  ApiState({
   this.alldata =  const <post>[],
   this.message = "",
  });
  ApiState copyWith({List<post> ?alldata, String ?message }){
   return ApiState(
     alldata: alldata ??  this.alldata,
     message:  message ?? this.message,
   );

  }

  @override
  List<Object?> get props => [alldata, message];
 }

