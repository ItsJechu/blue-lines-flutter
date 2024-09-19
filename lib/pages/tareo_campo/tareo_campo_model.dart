import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'tareo_campo_widget.dart' show TareoCampoWidget;
import 'package:flutter/material.dart';

class TareoCampoModel extends FlutterFlowModel<TareoCampoWidget> {
  ///  State fields for stateful widgets in this page.

  DateTime? datePicked;
  // State field(s) for actividad widget.
  String? actividadValue;
  FormFieldController<String>? actividadValueController;
  // State field(s) for labor widget.
  String? laborValue;
  FormFieldController<String>? laborValueController;
  // State field(s) for centro widget.
  String? centroValue;
  FormFieldController<String>? centroValueController;
  // State field(s) for jefe widget.
  String? jefeValue;
  FormFieldController<String>? jefeValueController;
  // State field(s) for personal widget.
  String? personalValue;
  FormFieldController<String>? personalValueController;
  // State field(s) for proyecto widget.
  String? proyectoValue;
  FormFieldController<String>? proyectoValueController;
  // State field(s) for tarea widget.
  String? tareaValue;
  FormFieldController<String>? tareaValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
