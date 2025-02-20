import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DotaHeroesJsonParsing extends StatefulWidget {
  const DotaHeroesJsonParsing({super.key});

  @override
  State<DotaHeroesJsonParsing> createState() => _DotaHerosJsonParsingState();
}

class _DotaHerosJsonParsingState extends State<DotaHeroesJsonParsing> {
  String url =
      'https://raw.githubusercontent.com/joshuaduffy/dota2api/master/dota2api/ref/heroes.json';

  getData() async {
    await http.get(Uri.parse(url)).then((response) {
      Map<String, dynamic> map = json.decode(response.body);
      print(map['count']);
      List<dynamic> list1 = map['heroes'];
      List<Map<String, dynamic>> list2 = [];
      list1.forEach((a) {
        Map<String, dynamic> map = {
          "name": a["localized_name"],
          "portrait_url": a["url_full_portrait"],
          "vertical_portrait_url": a["url_vertical_portrait"]
        };
        list2.add(map);
      });
      setState(() {
        list = list2;
      });
    });
  }

  List<Map<String, dynamic>> list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dota Hero'),
      ),
      body: list.length == 0
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: list.map((listData) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Material(
                    elevation: 2.0,
                    borderRadius: BorderRadius.circular(10.0),
                    child: Column(
                      children: <Widget>[
                        Text(
                          listData['name'],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Image.network(listData['portrait_url'])
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
    );
  }
}
