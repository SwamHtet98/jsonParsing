import 'package:flutter/material.dart';
import 'package:json_parsing/dota_heroes_json_parsing.dart';
import 'package:json_parsing/photo_json_page.dart';
import 'package:json_parsing/post_json_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),
      body: ListView(
        children: <Widget>[
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return PostJsonPage();
                  },
                ));
              },
              child: Text("Post Json Parsing")),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return PhotoJsonPage();
                  },
                ));
              },
              child: Text("Photo Json Parsing")),
               ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return DotaHeroesJsonParsing();
                  },
                ));
              },
              child: Text("Dota Heros Json Parsing")),
        ],
      ),
    );
  }
}
