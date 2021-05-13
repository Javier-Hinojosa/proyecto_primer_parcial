import 'package:flutter/material.dart';
import 'package:proyecto_1/Home_page.dart';
import 'package:proyecto_1/navigation_class/Alertas.dart';
import 'package:proyecto_1/navigation_class/Targetas.dart';

import 'navigation_class/Avatars.dart';

void main() {
      runApp(MyApp());

}

class MyApp extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
            return MaterialApp(
                  theme: ThemeData(
                      primarySwatch: Colors.amber, accentColor: Colors.amberAccent),
                  title: 'Proyecto 1',
                  initialRoute: "/",
                  routes: {
                        "/":(BuildContext context)=>Home_Page(),
                        "/first":(BuildContext context)=>Alertas(),
                        "/second":(BuildContext context)=>Avatars(),
                        "/third":(BuildContext context)=>Targetas(),
                  },
            );
      }
}

class SecondPageArguments {
      String name;
      SecondPageArguments({this.name});
}
