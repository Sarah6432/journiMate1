import 'package:flutter/material.dart';

class TelaFolha extends StatefulWidget {
  final Map<String, String>? anotacaoExistente;

  TelaFolha({this.anotacaoExistente});

  @override
  _TelaFolhaState createState() => _TelaFolhaState();
}

class _TelaFolhaState extends State<TelaFolha> {
  TextEditingController _tituloController = TextEditingController();
  TextEditingController _conteudoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.anotacaoExistente != null) {
      _tituloController.text = widget.anotacaoExistente!['titulo']!;
      _conteudoController.text = widget.anotacaoExistente!['conteudo']!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          widget.anotacaoExistente == null
              ? 'Nova Anotação'
              : 'Editar Anotação',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/wallpaper-diario1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _tituloController,
                    decoration: InputDecoration(
                      hintText: 'Título',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Expanded(
                    child: TextField(
                      controller: _conteudoController,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintText: 'Escreva sua anotação aqui...',
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      maxLines: null,
                      expands: true,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, {
                            'titulo': _tituloController.text,
                            'conteudo': _conteudoController.text,
                          });
                        },
                        child: Text('Salvar',
                            style: TextStyle(color: Color(0xffe1218b))),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancelar',
                            style: TextStyle(color: Color(0xffe1218b))),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
} 