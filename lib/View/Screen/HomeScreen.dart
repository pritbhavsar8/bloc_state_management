import 'package:bloc_state_management/Model/post.dart';
import 'package:bloc_state_management/bloc/Get_Api/api_bloc.dart';
import 'package:bloc_state_management/bloc/Get_Api/api_event.dart';

import 'package:bloc_state_management/bloc/Get_Api/api_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ApiBloc>().add(FatchApi());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        centerTitle: true,
      ),
      body: BlocBuilder<ApiBloc,ApiState>(
        builder: (context, state) {
          return ListView.builder(
              itemCount: state.alldata.length,
              itemBuilder: (context, index) {
                var item = state.alldata[index];
                return Card(
                  child: ListTile(
                    tileColor: Colors.orangeAccent.shade100,
                    title: Text(item.title.toString(),style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18.0),),
                    subtitle: Text(item.body.toString(),style:TextStyle(fontWeight: FontWeight.w500,fontSize: 14.0),),
                    trailing: Text(item.userId.toString()),
                    leading: Text(item.id.toString()),
                  ),
                );
              },
          );
        },
      ),
    );
  }
}
