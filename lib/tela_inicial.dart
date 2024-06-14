import 'loginPage.dart';
import 'package:flutter/material.dart';

class TelaInicial extends StatelessWidget {
  final Shader linearGradient1 = LinearGradient(
    colors: <Color>[
      Colors.white,
      Colors.white,
      Color.fromARGB(255, 247, 138, 201),
      Color.fromARGB(255, 224, 27, 166),
    ],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  final Shader linearGradient2 = LinearGradient(
    colors: <Color>[
      Color.fromARGB(255, 247, 138, 201),
      Color.fromARGB(255, 224, 27, 166),
     
    ],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 40.0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/wallpaper-diario1.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.only(
          top: 115,
          left: 40,
          right: 40,
        ),
        child: ListView(
          padding: EdgeInsets.only(top: 150, bottom: 20),
          children: <Widget>[
            SizedBox(
              width: 120,
              height: 120,
              child: Image.asset("assets/images/logo.png"),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 40,
              child: Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "Bem vindo ao ",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "fontenova",
                        fontWeight: FontWeight.bold,
                        foreground: Paint()..shader = linearGradient1,
                      ),
                    ),
                    TextSpan(
                      text: " journiMate!",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "fontenova",
                        fontWeight: FontWeight.bold,
                        foreground: Paint()..shader = linearGradient2,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [
                    Color.fromARGB(255, 247, 138, 201),
                    Color.fromARGB(255, 224, 27, 166),
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand( 
                child: TextButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Começar",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontFamily: "fontenova",
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(context, 
                    MaterialPageRoute(
                      builder: (context) => LoginPage()
                      ));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}