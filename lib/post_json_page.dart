import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PostJsonPage extends StatefulWidget {
  const PostJsonPage({super.key});

  @override
  State<PostJsonPage> createState() => _PostJsonPageState();
}

class _PostJsonPageState extends State<PostJsonPage> {
  var url = 'https://jsonplaceholder.typicode.com/posts';

  getData() async {
    await http.get(Uri.parse(url)).then((response) {
      List<dynamic> list1 = json.decode(response.body);
      print(list1.length);
      List<Map<String, dynamic>> list2 = [];
      list1.forEach((listData) {
        Map<String, dynamic> map = {
          "userId": listData["userId"],
          "id": listData["id"],
          "title": listData["title"],
          "body": listData["body"]
        };
        list2.add(map);
      });
      print(list2.length.toString() + "List2");
      setState(() {
        list = list2;
      });
    });
  }

  List<Map<String, dynamic>> list = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Posts"),
      ),
      body: list.length == 0
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: list.map((listData) {
                return Card(
                  child: ListTile(
                    title: Text(listData['title'].toString()),
                    subtitle: Text(listData['body']),
                    leading: Text(listData['userId'].toString()),
                  ),
                );
              }).toList(),
            ),
    );
  }
}
