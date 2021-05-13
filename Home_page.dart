import 'package:flutter/material.dart';
import 'package:proyecto_1/Menu_Provider.dart';
import 'package:proyecto_1/icono_string_util.dart';
import 'main.dart';

class Home_Page extends StatefulWidget {
  @override
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
bool _seleccion=false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Proyecto 1"),
          elevation: 15,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        body: _lista(context),
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
    final List<Widget> opciones = [];
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
          setState(() {
            seleccion(context: context,id:opt['id'], text:opt['texto']);
            _seleccion=true;
          });
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

Widget seleccion({BuildContext context,String id, String text}){
    Navigator.of(context).pushNamed(id, arguments: SecondPageArguments(name: text));
}



}
