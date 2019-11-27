import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 'Avaatar page '),
        actions: <Widget>[

          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage( 'https://img.vixdata.io/pd/jpg-large/es/sites/default/files/r/rip-stan-lee.jpg' ),
              radius: 22.0,
            ),
          ),

          Container(
            margin: EdgeInsets.only( right: 10.0 ),
            child: CircleAvatar(
              child: Text( 'SL' ),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage( 'http://bucket-contra.s3.amazonaws.com/wp-content/uploads/2019/04/StanLee-610719480.jpg' ),
          placeholder: AssetImage( 'assets/jar-loading.gif'),
          fadeInDuration: Duration( milliseconds: 300 ),
        ),
      ),
    );
  }
}