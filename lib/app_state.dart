import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _buscador = false;
  bool get buscador => _buscador;
  set buscador(bool value) {
    _buscador = value;
  }

  DocumentReference? _Hi;
  DocumentReference? get Hi => _Hi;
  set Hi(DocumentReference? value) {
    _Hi = value;
  }

  String _nombreEscaneado = '';
  String get nombreEscaneado => _nombreEscaneado;
  set nombreEscaneado(String value) {
    _nombreEscaneado = value;
  }
}
