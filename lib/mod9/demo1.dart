import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'Cat.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppHomePage(title: ""),
    );
  }
}

class AppHomePage extends StatelessWidget {
  String title;

  AppHomePage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        body: LoadCat());
  }
}

class CatView extends StatelessWidget {
  Cat zouzou;

  CatView(this.zouzou);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(zouzou.urlImage ?? "",
            width: zouzou.width, height: zouzou.height)
      ],
    );
  }
}

class LoadCat extends StatefulWidget {
  @override
  State<LoadCat> createState() => _LoadCatState();
}

class _LoadCatState extends State<LoadCat> {
  Cat? zouzou;
  List<Cat> cats = [];

  void getCat() async {
    var response =
        await http.get(Uri.parse("https://api.thecatapi.com/v1/images/search"));

    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);
      setState(() {
        zouzou = Cat.fromJson(json[0]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(onPressed: getCat, child: Text("Get cat !")),
        if (zouzou != null) CatView(zouzou!),
        FutureBuilder<http.Response>(
            future: http.get(Uri.parse(
                "https://api.thecatapi.com/v1/images/search?limit=20")),
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data?.body != null) {
                var json = convert.jsonDecode(snapshot.data!.body);

                cats = List<Cat>.from(json.map((data) => Cat.fromJson(data)));

                return Expanded(
                  child: ListView.builder(
                      itemCount: cats.length,
                      itemBuilder: (context, index) {
                        return CatView(cats[index]);
                      }),
                );
              }
              return CircularProgressIndicator();
            })
      ],
    );
  }
}
