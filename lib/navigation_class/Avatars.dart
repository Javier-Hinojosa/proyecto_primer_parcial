import 'package:flutter/material.dart';

class Avatars extends StatelessWidget{
  String texto;


  Avatars(this.texto);

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Color(0xfffcde3e),
      child:Center( child:Text("me diste click \n\n"
          "soy la opcion $texto", style: TextStyle(fontSize: 20, ),),),
      width: 1000,
      height: 1000,
    );
  }





}