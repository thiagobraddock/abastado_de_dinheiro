import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

class Rico extends StatefulWidget {
  @override
  _RicoState createState() => _RicoState();

}

//classe interna do tipo State, que recebe a Class Rico
class _RicoState extends State<Rico> {

  double _contador = 10;

  void _nathan()
  {
    print("Nao escuta");
  }

  void _showDialog()
  {
    showDialog(
        context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("GAME OVER"),
          content: Text("Você Perdeu Tudo - You Loose!!"),
          actions: <Widget>[
            new FlatButton(onPressed: ()=> exit(0),
            child: Text("Fechar")
            ),

          ],
        );
      },
    );
  }//ShowDialog




  void _maisGrana()
  {
    setState(() {
      //método responsável pela atualização(valores) da nossa tela

      Random sorteio = new Random();

      int min = 1;
      int max = 5;
      int r = min + sorteio.nextInt(max - min);

      if(r == 1)
        {
          //se o sorteio for = 1 o usuario ganha 10
          _contador = _contador + 10;

          print(r);

        }
      else if(r == 2)
        {
          //se o sorteio for = 2 o usuario tem seu dinheiro duplicado
          _contador = _contador *2;

          print(r);

        }
      else if(r == 3)
        {
          //se o sorteio for = 3 o usuario perde 10
          _contador = _contador - 10;

          print(r);
        }
      else if(r ==4)
        {
          _contador = _contador / 2;
          print(r);
        }

      if(_contador <= 0)
        {
          _showDialog();
          _contador = 10;
        }

    });
  }




  @override
  Widget build(BuildContext context) {
    //Cria a tela(ui)
    return Scaffold(
      appBar: AppBar(
        title: Text("\$ Rico App \$",
        style: TextStyle(
          color: Colors.white,
        ),),
        backgroundColor: Colors.lightBlue,
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          child: Column(
            children: <Widget>[
              //Título do App
              Expanded(
                child: Center(
                  child: Text("Venha Ficar Rico!!!",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.lightBlue,
                  ),
                  ),
                ),
              ),

              //valor em dinheiro
              Expanded(
                child: Center(
                  child: Text("R\$ $_contador",
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                    color: _contador >= 150 ? Colors.red : Colors.green,
                  ),
                  ),
                ),
              ),

              //Botão de Ação
              Expanded(
                child: Center(
                  child: FlatButton(
                      onPressed: _maisGrana,
                      color: Colors.lightBlue,
                      textColor: Colors.white,

                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text("Mais Grana!!!!",
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
