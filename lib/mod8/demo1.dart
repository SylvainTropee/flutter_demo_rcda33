import 'package:demo_cda_33/mod8/page1.dart';
import 'package:demo_cda_33/mod8/page2.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  //réécriture d'url pour virer le # pour le web
  setPathUrlStrategy();
  runApp(App());
}

class Routes {
  static Map<String, WidgetBuilder> getRoutes(BuildContext context){
    return {
      "/page-1" : (context) => PageOne(),
      "/page-2" : (context) => PageTwo()
    };
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/page-1",
      routes: Routes.getRoutes(context)
    );
  }
}

