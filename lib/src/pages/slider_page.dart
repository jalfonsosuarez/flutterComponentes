import 'package:flutter/material.dart';


class SLiderPage extends StatefulWidget {
  SLiderPage({Key key}) : super(key: key);

  @override
  _SLiderPageState createState() => _SLiderPageState();
}

class _SLiderPageState extends State<SLiderPage> {

  double _valorSlider = 100.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 'Sliders' ),
      ),
      body: Container(
        padding: EdgeInsetsDirectional.only( top: 50.0 ),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen()
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {

    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      // divisions: 20,
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      onChanged: ( _bloquearCheck ) ? null : 
      ( valor ){
        setState(() {
          _valorSlider = valor;    
        });
      },
    );

  }

  Widget _crearCheckBox() {

    // return Checkbox(
    //   value: _bloquearCheck,
    //   onChanged: ( valor ) {
    //     setState(() {
    //       _bloquearCheck = valor;          
    //     });
    //   },
    // );


    return CheckboxListTile(
      title: Text( 'Bloquear slider' ),
      value: _bloquearCheck,
      onChanged: ( valor ) {
        setState(() {
          _bloquearCheck = valor;          
        });
      },
    );

  }

  Widget _crearSwitch() {

    return SwitchListTile(
      title: Text( 'Bloquear slider' ),
      value: _bloquearCheck,
      onChanged: ( valor ) {
        setState(() {
          _bloquearCheck = valor;          
        });
      },
    );
    
  }

  Widget _crearImagen() {

    return Image(
      image: NetworkImage( 'https://i.dlpng.com/static/png/1200983-batman-png-batman-png-1404_1500_preview.png' ),
      width: _valorSlider,
      fit: BoxFit.contain,
    );

  }

}