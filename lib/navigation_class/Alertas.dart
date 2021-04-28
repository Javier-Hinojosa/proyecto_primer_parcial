import 'package:flutter/material.dart';

class Alertas extends StatelessWidget{
  String texto;


  Alertas(this.texto);

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Color(0xfff8da65),
      child:Center( child:Text("me diste click \n\n"
          "soy la opcion $texto", style: TextStyle(fontSize: 20, ),),),
      width: 1000,
      height: 1000,
    );
  }





}