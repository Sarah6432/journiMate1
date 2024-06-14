import 'package:flutter/material.dart';
import 'package:jounimate/tela_inicial.dart';
import 'package:provider/provider.dart';
import 'authservice.dart';
import 'resetarSenha.dart';
import 'tela_modelos.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final senha = TextEditingController();

  bool isLogin = true;
  late String titulo;
  late String actionButton;
  late String toggleButton;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    setFormAction(true);
  }

  setFormAction(bool acao) {
    setState(() {
      isLogin = acao;
      if (isLogin) {
        titulo = 'Faça seu login';
        actionButton = 'Entrar';
        toggleButton = 'Ainda não tem conta? Cadastre-se agora.';
      } else {
        titulo = 'Crie sua conta';
        actionButton = 'Cadastrar';
        toggleButton = 'Voltar ao Login.';
      }
    });
  }

  login() async {
    setState(() => loading = true);
    try {
      await context.read<AuthService>().login(email.text, senha.text);

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => TelaModelos()));
    } on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  registrar() async {
    setState(() => loading = true);
    try {
      await context.read<AuthService>().registrar(email.text, senha.text);
      
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => TelaModelos()));
    } on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  logout() {
    
    email.clear();
    senha.clear();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => TelaInicial()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagem de fundo
          Image.asset(
            'assets/images/wallpaper-diario1.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 100),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      titulo,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'fontenova',
                        letterSpacing: -1.5,
                        color: Color.fromARGB(255, 224, 27, 166),
                      ),
                    ),
                    SizedBox(height: 24),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.black38),
                          fillColor: Colors.black,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black38),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.black38),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Informe o email corretamente!';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 12),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: TextFormField(
                        controller: senha,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Senha',
                          labelStyle: TextStyle(color: Colors.black38),
                          fillColor: Colors.black,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black38),
                          ),
                        ),
                        style: TextStyle(color: Colors.black38),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Informe sua senha!';
                          } else if (value.length < 6) {
                            return 'Sua senha deve ter no mínimo 6 caracteres';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 24),
                    Padding(
                      padding: EdgeInsets.all(24.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            if (isLogin) {
                              login();
                            } else {
                              registrar();
                            }
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: (loading)
                              ? [
                                  Padding(
                                    padding: EdgeInsets.all(16),
                                    child: SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: CircularProgressIndicator(
                                        color: Colors.pink,
                                      ),
                                    ),
                                  )
                                ]
                              : [
                                  IconTheme(
                                  data: IconThemeData(color:Color.fromARGB(255, 224, 27, 166)), // Cor do ícone
                                  child: Icon(Icons.check),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(
                                      actionButton,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color:  Color.fromARGB(255, 224, 27, 166), // Cor do texto
                                      ),
                                    ),
                                  ),
                                ],
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => setFormAction(!isLogin),
                      child: Text(
                        toggleButton,
                        style: TextStyle(
                          color:Color.fromARGB(255, 224, 27, 166),
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          decorationColor: Color.fromARGB(255, 224, 27, 166),
                        ),
                      ),
                    ),
                    Container(
                      height: 40,
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        child: Text(
                          "Esqueci a senha.",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color.fromARGB(255, 224, 27, 166),
                            decoration: TextDecoration.underline,
                            decorationColor: Color.fromARGB(255, 224, 27, 166),
                            fontSize: 14,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResetarSenha(),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: logout,
                      child: Text(
                        'sair',
                        style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 224, 27, 166)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
