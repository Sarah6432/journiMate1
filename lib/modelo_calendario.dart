import 'package:flutter/material.dart';

class ModeloCalendario with ChangeNotifier {
  Map<DateTime, List<String>> eventos = {};

  void adicionarEvento(DateTime data, String evento) {
    final dataNormalizada = DateTime(data.year, data.month, data.day);
    if (eventos[dataNormalizada] == null) {
      eventos[dataNormalizada] = [];
    }
    eventos[dataNormalizada]?.add(evento);
    notifyListeners();
  }

  List<String> obterEventos(DateTime data) {
    final dataNormalizada = DateTime(data.year, data.month, data.day);
    return eventos[dataNormalizada] ?? [];
  }

  Map<DateTime, List<String>> obterTodosEventos() {
    return eventos;
  }
}