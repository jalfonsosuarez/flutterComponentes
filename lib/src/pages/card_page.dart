import 'package:flutter/material.dart';   


class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 'Cards page' ),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
          SizedBox(height: 30.0,),
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
          SizedBox(height: 30.0,),
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
          SizedBox(height: 30.0,),
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2(),
          SizedBox(height: 30.0,),
        ],
      ),
    );
  }

  Widget _cardTipo1() {

    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular( 20.0 )),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon( Icons.photo_album, color: Colors.blue, ),
            title: Text( 'Soy el título!!!' ),
            subtitle: Text( 'Esto es un texto largo para poner en la tarjeta de Flutter para ver como se identa.' ),            
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text( 'Cancelar' ),
                onPressed: (){},
              ),
              FlatButton(
                child: Text( 'Ok' ),
                onPressed: (){},
              ),
            ],
          )
        ],
      ),
    );

  }

  Widget _cardTipo2() {

    final card = Container(
      // clipBehavior: Clip.antiAlias,
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage( 'https://iso.500px.com/wp-content/uploads/2014/06/W4A2827-1-3000x2000.jpg' ),
            placeholder: AssetImage( 'assets/jar-loading.gif' ),
            fadeInDuration: Duration( milliseconds: 200 ),
            height: 300.0,
            fit: BoxFit.cover
          ),
          // Image(
          //   image: NetworkImage( 'https://iso.500px.com/wp-content/uploads/2014/06/W4A2827-1-3000x2000.jpg' ),
          // ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text( 'No se que poner.')
          )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          )
        ]
        // color: Colors.red
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular( 30.0 ),
        child: card,
      ),
    );

  }

}