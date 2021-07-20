import 'package:flutter/material.dart';

void main() {
/**Material app --> Widget que suporta material design
 * title e home são parametros
 * container é um local que se pode colocar mais widgets
 * a coluna sempre segue a ordem do codigo*/
  runApp(MaterialApp(
    title: "Contador de Pessoas",
    /**Column é um widget que suporta outros widgets um acima do outro*/
    home: Home()));

}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
/**A função build é invocada sempre que queremos modificar algo no layou*/
class _HomeState extends State<Home> {
  int _people = 0;
  String _infoText = "Pode Entrar";
  void _changePeople(int delta){
    setState(() {
      _people += delta;
      if(_people <0){
        _infoText = "Mundo Invertido?";
      }else if(_people <=10){
        _infoText = "Pode entrar!";
      }else{
        _infoText = "Lotado!";
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/pizza.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          /**Especifica o alinhamento da coluna*/
          mainAxisAlignment: MainAxisAlignment.center,
          /**Colocando mais Widgets com o children*/
          children: <Widget>[
            Text("Pessoas: $_people", style: TextStyle(color: Colors.black,
              fontWeight: FontWeight.bold,),
            ),
            /**Row é semelhante a Column mas na horizontal*/
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    /**Parametros child e são obrigatorios
                     * parametro child permite que se coloque apenas um widget como
                     * filho no flat button*/
                    child: Text("+1", style: TextStyle( fontSize: 40.0, color:
                    Colors.black),
                    ),
                    onPressed: (){_changePeople(1);},
                    /**onPressed é uma função que será invocada quando apertar o botão*/
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text("-1", style: TextStyle( fontSize: 40.0, color:
                    Colors.black),
                    ),
                    onPressed: (){_changePeople(-1);},
                  ),
                ),
              ],
            ),
            Text(_infoText, style: TextStyle(color: Colors.black,
              fontStyle: FontStyle.italic,
              fontSize: 30.0,),
            ),
          ],
        ),
      ],
    );
  }
}
/**A função build é invocada sempre que queremos modificar algo no layou*/