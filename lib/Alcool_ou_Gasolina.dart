import 'package:flutter/material.dart';

class Alcool_ou_Gasolina extends StatefulWidget {
  @override
  _Alcool_ou_GasolinaState createState() => _Alcool_ou_GasolinaState();
}

class _Alcool_ou_GasolinaState extends State<Alcool_ou_Gasolina> {
  var _logo = AssetImage("images/logo.png");
  String _texto = "Saiba qual a melhor opção para abastecimento do seu carro";
 var _resultado = "";
  TextEditingController _controllerAlcool = new TextEditingController();
  TextEditingController _controllerGasolina = new TextEditingController();
  
  
  void _calcular(){
    //converter o string para double
   double precoAlcool = double.tryParse(_controllerAlcool.text);
double precoGasolina = double.tryParse(_controllerGasolina.text);
    if(precoAlcool == null || precoGasolina == null){
     setState(() {
        _resultado = "Número inválido, digite números maiores que 0 e utilizalo (.)";
     });
    
    } else{
      _Limparcampos();
    /*
    Se o preço do álcool divido pelo preço da gasolina
    for >= a 0.7 é melhor abastecer com gasolina
    senão é melhor utilizar álcool.
    
    */ 
    if((precoAlcool/precoGasolina) >= 0.7){
      setState(() {
        _resultado = "Melhor abastecer com gasolina";
      });
    } else {
      setState(() {
        _resultado = "Melhor utilizar álcool";
      });
      
    }
    }
  }

  void _Limparcampos(){
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Alcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
        body: Container( 
        
       child: SingleChildScrollView(
          padding:  EdgeInsets.all(32),
child:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
         children: <Widget>[
           Padding(padding: EdgeInsets.only(bottom: 32),
            child: Image(image: _logo,)
           ),
          Padding(padding: EdgeInsets.only( bottom: 10),
            child:Text(_texto,
            textAlign: TextAlign.left,
            style: TextStyle(
            fontSize: 25,
            
            fontWeight: FontWeight.bold,
              

            ),
            ),
          ),
          
          TextField(
            
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Preço Alcool,ex: 1.59",
               
            ),
            style: TextStyle(
            fontSize: 22,
          ), controller: _controllerAlcool,
          ),
         
           Padding(padding: EdgeInsets.only(bottom: 10),
         child: TextField(
            
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Preço Gasolina,ex: 3.15",
               
            ),
          style: TextStyle(
            fontSize: 22,
          ),
          controller: _controllerGasolina,
          ),

          ),
          
         RaisedButton(onPressed:_calcular ,
         padding: EdgeInsets.all(10),
          child: Text("Calcular",
          textAlign: TextAlign.center, 
          style:TextStyle(
           fontWeight: FontWeight.bold,              
         fontSize: 22,
           color: Colors.white 
          ) ,),
          color: Colors.lightBlue,
          
          ),
          Padding(padding: EdgeInsets.only(top:20),
           child: Text(
             _resultado,
           style: TextStyle(
             fontSize:22,
             fontWeight: FontWeight.bold
           ),
           ),
           )
         ],

        ),
       ),
    ),);}


}