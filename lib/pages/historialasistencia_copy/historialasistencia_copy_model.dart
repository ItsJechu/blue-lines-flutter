import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'historialasistencia_copy_widget.dart'
    show HistorialasistenciaCopyWidget;
import 'package:flutter/material.dart';

class HistorialasistenciaCopyModel
    extends FlutterFlowModel<HistorialasistenciaCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<AsistenciaRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
