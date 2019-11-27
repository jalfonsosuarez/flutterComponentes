import 'package:flutter/material.dart';


class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre              = '';
  String _email               = '';
  String _password            = '';
  String _fecha               = '';
  String _opcionSeleccionada  = 'Volar';

  TextEditingController _inputFieldDateController = new TextEditingController();

  List<String> _poderes =  [ 'Volar', 'Rayos X', 'Super aliento', 'Super fuerza' ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 'Inputs de texto' ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric( horizontal: 10.0, vertical: 20.0 ),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha( context ),
          Divider(),
          _crearDropDown(),
          Divider(),
          _crearPersona()
        ],
      ),
    );
  }

  Widget _crearInput() {

    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),

        ),
        counter: Text( 'Letras ${_nombre.length}' ),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Indique solo el nombre',
        suffixIcon: Icon( Icons.accessibility ),
        icon: Icon( Icons.account_circle ),
      ),
      onChanged: ( valor ){
        setState(() {          
          _nombre = valor;
        });
      },
    );

  }

  Widget _crearEmail() {

    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),

        ),
        hintText: 'Email',
        labelText: 'Email   ',
        suffixIcon: Icon( Icons.alternate_email ),
        icon: Icon( Icons.email ),
      ),
      onChanged: ( valor ) => setState(() {          
          _email = valor;
        })
    );

  }

  Widget _crearPassword() {

    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),

        ),
        hintText: 'Contraseña',
        labelText: 'Contraseña',
        suffixIcon: Icon( Icons.lock_open ),
        icon: Icon( Icons.lock ),
      ),
      onChanged: ( valor ) => setState(() {          
          _password = valor;
        })
    );

  }

  Widget _crearFecha( BuildContext context ) {
    
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon( Icons.perm_contact_calendar ),
        icon: Icon( Icons.calendar_today ),
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate( context );
      },
    );
  }

  _selectDate( BuildContext context ) async {

    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2035),
      locale: Locale('es', 'ES')
    );

    if ( picked != null ) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }

  }

  List<DropdownMenuItem<String>> getOpcionesDropDown() {

    List<DropdownMenuItem<String>> lista = new List();

    _poderes.forEach( (poder) {

      lista.add( DropdownMenuItem(
        value: poder,
        child: Text( poder ),
      ));

    });

    return lista;

  }

  Widget _crearDropDown() {

    return Row(
      children: <Widget>[
        Icon( Icons.select_all ),
        SizedBox( width: 30.0, ),
        Expanded(
          child: DropdownButton(
            value: _opcionSeleccionada,
            items: getOpcionesDropDown(),
            onChanged: ( opt ){
              setState(() {
                _opcionSeleccionada = opt;
              });
            },
          ),
        )
      ],
    );
        
  }

  Widget _crearPersona() {

    return ListTile(
      title: Text( 'Nombre es: $_nombre' ),
      subtitle: Text( 'email: $_email - password: $_password' ),
      trailing: Text( _opcionSeleccionada ),
    );

  }

}