import '/flutter_flow/flutter_flow_util.dart';
import 'rendimiento_cosecha_widget.dart' show RendimientoCosechaWidget;
import 'package:flutter/material.dart';

class RendimientoCosechaModel
    extends FlutterFlowModel<RendimientoCosechaWidget> {
  ///  Local state fields for this page.

  DateTime? timeClock;

  DateTime? checkInTime;

  DateTime? checkOutTime;

  bool isCheckIn = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  final textFieldKey2 = GlobalKey();
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? textFieldSelectedOption2;
  String? Function(BuildContext, String?)? textController2Validator;
  var trabajadorescaneado = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
  }
}
