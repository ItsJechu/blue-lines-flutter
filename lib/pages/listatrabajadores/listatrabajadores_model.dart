import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'listatrabajadores_widget.dart' show ListatrabajadoresWidget;
import 'package:flutter/material.dart';

class ListatrabajadoresModel extends FlutterFlowModel<ListatrabajadoresWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<CosechadoresRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
