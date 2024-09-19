import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'registroevaluacionfitosanitaria_copy2_widget.dart'
    show RegistroevaluacionfitosanitariaCopy2Widget;
import 'package:flutter/material.dart';

class RegistroevaluacionfitosanitariaCopy2Model
    extends FlutterFlowModel<RegistroevaluacionfitosanitariaCopy2Widget> {
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
  String? secvalvuValue1;
  FormFieldController<String>? secvalvuValueController1;
  // State field(s) for secvalvu widget.
  String? secvalvuValue2;
  FormFieldController<String>? secvalvuValueController2;
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
