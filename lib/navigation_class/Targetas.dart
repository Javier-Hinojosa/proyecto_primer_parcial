import 'package:flutter/material.dart';

class Targetas extends StatelessWidget{
  String texto;

  Targetas(this.texto);

  @override
  Widget build(BuildContext context) {

    return Container(
        color: Color(0xfffad214),
        child:Center( child:Text("me diste click \n\n"
            "soy la opcion $texto", style: TextStyle(fontSize: 20, ),),),
        width: 1000,
        height: 1000,
      );

  }





}