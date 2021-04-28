import 'package:flutter/material.dart';
import 'package:proyecto_1/Menu_Provider.dart';
import 'package:proyecto_1/icono_string_util.dart';
import 'package:proyecto_1/navigation_class/Avatars.dart';
import 'package:proyecto_1/navigation_class/Targetas.dart';

import 'navigation_class/Alertas.dart';

class Home_Page extends StatefulWidget {
  @override
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
int _seleccion=0;
String mensaje="alertas";
  _getDrawer_item_widget(int pos, String texto){
    switch(pos){
      case 0: return Alertas(texto);
      case 1: return Avatars(texto);
      case 2: return Targetas(texto);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proyecto 1',
      theme: ThemeData(
          primarySwatch: Colors.amber, accentColor: Colors.amberAccent),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Proyecto 1"),
          elevation: 15,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        drawer: Drawer(
          child: _lista(context),
        ),
        body: _getDrawer_item_widget(_seleccion,mensaje),
      ),
    );
  }

  Widget _lista(BuildContext context) {
    return FutureBuilder(
        future: MenuProvider.cargarData(),
        initialData: [],
        builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
          return ListView( children: _listItems(snapshot.data, context),);
        });
  }

  List<Widget> _listItems(List<dynamic> data, BuildContext context) {
    final widgethead=UserAccountsDrawerHeader(
      accountName: Text("Hinojosa sánchez Javier Alberto"),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white54,
        child: Text(
          "H",
          style: TextStyle(fontSize: 40),
        ),
      ), accountEmail: Text("Desarrollo de aplicaciones Moviles"),
    );
    final List<Widget> opciones = [];
    opciones..add(widgethead);
    data.forEach((opt) {
      final widgeTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        selected: (opt['id']==_seleccion),
        trailing: Icon(
          Icons.keyboard_arrow_right_sharp,
          color: Colors.amberAccent,
        ),
        onTap: () {
          /*showDialog(
            context: context,
            builder: (BuildContext context) =>
                _builpopUpDialog(context, opt['texto']),
          );*/
          Navigator.of(context).pop();
          _onSelect(opt['id'], opt['texto']);
        },
      );
      opciones..add(widgeTemp)..add(Divider());
    });
    return opciones;
  }

 /* Widget _builpopUpDialog(BuildContext context, String opt) {
    return new AlertDialog(
      title: const Text('me diste click'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text('soy la opcion ' + opt)],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('cerrar'),
        )
      ],
    );
  }*/
  _onSelect(int position, String texto){
    setState(() {
      _seleccion=position;
      mensaje=texto;
    });
  }
}
