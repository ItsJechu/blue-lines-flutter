import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'marcar_horasalida_widget.dart' show MarcarHorasalidaWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MarcarHorasalidaModel extends FlutterFlowModel<MarcarHorasalidaWidget> {
  ///  Local state fields for this page.

  DateTime? timeClock;

  DateTime? checkInTime;

  DateTime? checkOutTime;

  bool isCheckIn = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;
  var nombreEscaneado = '';
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  AsistenciaRecord? asistenciaSimple;
  AudioPlayer? soundPlayer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
  }
}
