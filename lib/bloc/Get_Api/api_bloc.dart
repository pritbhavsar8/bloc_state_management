import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/Model/post.dart';
import 'package:bloc_state_management/Repo/Post_Repo.dart';
import 'package:bloc_state_management/bloc/Get_Api/api_event.dart';
import 'package:bloc_state_management/bloc/Get_Api/api_state.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  PostRepo postRepo = PostRepo();
  ApiBloc() : super(ApiState()) {
    on<FatchApi>(fetchApi);

  }
  void fetchApi(FatchApi event ,Emitter<ApiState> emit) async{
   await postRepo.getdata().then((value){
      emit(state.copyWith(
        message: "sucess",
        alldata: value
      ));
      
    }).onError((error, stackTrace) {
      emit(state.copyWith(
          message: error.toString(),

      ));
    });

  }
}
