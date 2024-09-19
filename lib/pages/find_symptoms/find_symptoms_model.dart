import '/flutter_flow/flutter_flow_util.dart';
import 'find_symptoms_widget.dart' show FindSymptomsWidget;
import 'package:flutter/material.dart';

class FindSymptomsModel extends FlutterFlowModel<FindSymptomsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for searchField widget.
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldTextController;
  String? Function(BuildContext, String?)? searchFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchFieldFocusNode?.dispose();
    searchFieldTextController?.dispose();
  }
}
