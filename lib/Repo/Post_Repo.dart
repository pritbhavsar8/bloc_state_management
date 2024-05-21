import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc_state_management/Model/post.dart';
import 'package:http/http.dart' as http;

class PostRepo
{
  Future<List<post>> getdata()async{
    try
    {
      Uri url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
      final response = await http.get(url);
      if(response.statusCode== 200) {
         final body = json.decode(response.body) as List;
        return body.map((e) {
          return post(
              userId: e["userId"],
              id: e["id"],
              body: e["body"],
              title: e["title"]
          );
        }).toList();
      }
    }on SocketException{
      throw Exception("error while fatching");
    }on TimeoutException{

    }
    throw Exception("error while fatching");

  }

}
