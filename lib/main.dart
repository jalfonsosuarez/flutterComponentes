import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
 
// import 'package:componentes/src/pages/home_temp.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/routes/routes.dart';


void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English
        const Locale('es', 'ES'), // Hebrew
      ],


      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      initialRoute: '/',
      routes: getApplicarionRoutes(),
      onGenerateRoute: ( RouteSettings settings  ){
        
        return MaterialPageRoute(
          builder: ( BuildContext context ) => AlertPage()
        );

      },
    );
  }
}