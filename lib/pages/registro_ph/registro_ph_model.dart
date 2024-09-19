import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'registro_ph_widget.dart' show RegistroPhWidget;
import 'package:flutter/material.dart';

class RegistroPhModel extends FlutterFlowModel<RegistroPhWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for variedad widget.
  String? variedadValue;
  FormFieldController<String>? variedadValueController;
  // State field(s) for grupolad widget.
  String? grupoladValue;
  FormFieldController<String>? grupoladValueController;
  // State field(s) for SFR widget.
  FocusNode? sfrFocusNode;
  TextEditingController? sfrTextController;
  String? Function(BuildContext, String?)? sfrTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    sfrFocusNode?.dispose();
    sfrTextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController2?.dispose();

    textFieldFocusNode2?.dispose();
    textController3?.dispose();

    textFieldFocusNode3?.dispose();
    textController4?.dispose();

    textFieldFocusNode4?.dispose();
    textController5?.dispose();

    textFieldFocusNode5?.dispose();
    textController6?.dispose();

    textFieldFocusNode6?.dispose();
    textController7?.dispose();
  }
}
