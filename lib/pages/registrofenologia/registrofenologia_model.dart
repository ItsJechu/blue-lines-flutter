import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'registrofenologia_widget.dart' show RegistrofenologiaWidget;
import 'package:flutter/material.dart';

class RegistrofenologiaModel extends FlutterFlowModel<RegistrofenologiaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for variedad widget.
  String? variedadValue;
  FormFieldController<String>? variedadValueController;
  // State field(s) for lotemod widget.
  String? lotemodValue;
  FormFieldController<String>? lotemodValueController;
  // State field(s) for grupolad widget.
  String? grupoladValue;
  FormFieldController<String>? grupoladValueController;
  // State field(s) for secvalvu widget.
  String? secvalvuValue;
  FormFieldController<String>? secvalvuValueController;
  // State field(s) for fenologia widget.
  String? fenologiaValue;
  FormFieldController<String>? fenologiaValueController;
  // State field(s) for nroplanta widget.
  FocusNode? nroplantaFocusNode;
  TextEditingController? nroplantaTextController;
  String? Function(BuildContext, String?)? nroplantaTextControllerValidator;
  // State field(s) for grado widget.
  FocusNode? gradoFocusNode;
  TextEditingController? gradoTextController;
  String? Function(BuildContext, String?)? gradoTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nroplantaFocusNode?.dispose();
    nroplantaTextController?.dispose();

    gradoFocusNode?.dispose();
    gradoTextController?.dispose();
  }
}
