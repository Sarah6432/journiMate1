import 'package:flutter/material.dart';
import 'package:jounimate/authservice.dart';
import 'package:provider/provider.dart';
import 'tela_modelos.dart';
import 'tela_folha.dart';
import 'tela_calendario.dart';
import 'modelo_calendario.dart';
import 'tela_inicial.dart'; // Importe sua página de login aqui
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
       ChangeNotifierProvider(create: (context) => AuthService()),
      ],
      child: MeuApp(),

  ));
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ModeloCalendario()),
      ],
      child: MaterialApp(
        title: 'journiMate',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => TelaInicial(), // Rota inicial é a página de login
          '/folha': (context) => TelaFolha(),
          '/calendario': (context) => TelaCalendario(),
          '/diario': (context) => TelaModelos(),
        },
      ),
    );
  }
}
