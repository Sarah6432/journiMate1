 import'package:flutter/material.dart';
import 'tela_folha.dart';

class TelaDiario extends StatefulWidget {
  @override
  _TelaDiarioState createState() => _TelaDiarioState();
}

class _TelaDiarioState extends State<TelaDiario> {
  List<Map<String, String>> anotacoes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/wallpaper-diario1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 40.0, left: 16.0, right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text(
                        'Anotações:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.account_circle,
                        color: Colors.white, size: 32),
                    onPressed: () {
                      Navigator.pushNamed(context, '/perfil');
                    },
                    iconSize: 32,
                  ),
                ],
              ),
            ),
            Expanded(
              child: anotacoes.isEmpty
                  ? Center(
                      child: Text(
                        'Nenhuma anotação disponível.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: anotacoes.length,
                      itemBuilder: (context, index) {
                        final anotacao = anotacoes[index];
                        return anotacaoWidget(
                          context,
                          anotacao['titulo']!,
                          anotacao['conteudo']!,
                          index,
                        );
                      },
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildRoundedButton(
                    icon: Icons.calendar_today,
                    onPressed: () {
                      Navigator.pushNamed(context, '/calendario');
                    },
                  ),
                  SizedBox(width: 20),
                  _buildRoundedButton(
                    icon: Icons.add,
                    onPressed: () async {
                      final novaAnotacao = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TelaFolha()),
                      );
                      if (novaAnotacao != null) {
                        setState(() {
                          anotacoes.add(novaAnotacao);
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoundedButton(
      {required IconData icon, required VoidCallback onPressed}) {
    return ClipOval(
      child: Material(
        color: Colors.black.withOpacity(0.3),
        child: InkWell(
          splashColor: Colors.white.withOpacity(0.3),
          onTap: onPressed,
          child: SizedBox(
            width: 80,
            height: 80,
            child: Icon(icon, color: Colors.white, size: 40),
          ),
        ),
      ),
    );
  }

  Widget anotacaoWidget(
      BuildContext context, String titulo, String conteudo, int index) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(titulo),
        subtitle: Text(conteudo),
        onTap: () async {
          final anotacaoEditada = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TelaFolha(
                anotacaoExistente: {'titulo': titulo, 'conteudo': conteudo},
              ),
            ),
          );
          if (anotacaoEditada != null) {
            setState(() {
              anotacoes[index] = anotacaoEditada;
            });
          }
        },
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Color(0x340c0909)),
          onPressed: () {
            setState(() {
              anotacoes.removeAt(index);
            });
          },
        ),
      ),
    );
  }
}