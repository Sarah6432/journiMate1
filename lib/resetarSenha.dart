import 'package:flutter/material.dart';

class ResetarSenha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       backgroundColor: Color.fromARGB(255, 119, 142, 192),
       bottomOpacity: 0.7,
       leading: IconButton(
         icon: Icon(Icons.arrow_back),
         color: Colors.black38,
         onPressed: () {
           Navigator.pop(context, false);
         },
       ),
     ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/wallpaper-diario1.jpg"),
            fit: BoxFit.cover,  
            ),
          ),
          padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
      ),
      child: ListView(
        children: <Widget>[
         Opacity(
          opacity: 0.8,
          child: SizedBox(
           width: 200,
           height: 200,
           child: Image.asset("assets/images/resetPassword1.png"),
  ),
),
          SizedBox(
            height: 20,
          ),
          Text(
            "Esqueceu sua senha?",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 224, 27, 166),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Por favor, informe o email associado a sua conta. Nós enviaremos um link para o email para redefinir sua senha.",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color:Colors.black87
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: "Digite seu email...",
              icon: Icon(Icons.email),
              labelStyle: TextStyle(
                color: Colors.black38,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            style: TextStyle(
              fontSize: 14,
            ),
          ),
            SizedBox(
              height: 20,
            ),
          Container(
            height: 60,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.3, 0.5, 1.0],
                  colors: [
                    Color.fromARGB(255, 226, 48, 167),
                    Color.fromARGB(255, 225, 32, 152),
                    Color.fromARGB(255, 224, 27, 166),
                ],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: SizedBox.expand(
              child: TextButton(
                child: Text(
                  "Enviar",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                onPressed: () {},
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
      ),
    );
  }
} 