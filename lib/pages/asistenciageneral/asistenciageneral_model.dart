import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'asistenciageneral_widget.dart' show AsistenciageneralWidget;
import 'package:flutter/material.dart';

class AsistenciageneralModel extends FlutterFlowModel<AsistenciageneralWidget> {
  ///  Local state fields for this page.

  DateTime? timeClock;

  DateTime? checkInTime;

  DateTime? checkOutTime;

  bool isCheckIn = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in asistenciageneral widget.
  AsistenciaRecord? asistenciaOutput;
  InstantTimer? instantTimer;
  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;
  var mm = '';
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  AsistenciaRecord? checkinOutput;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
    textFieldFocusNode?.dispose();
  }
}
