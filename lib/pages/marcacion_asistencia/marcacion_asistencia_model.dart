import '/flutter_flow/flutter_flow_util.dart';
import 'marcacion_asistencia_widget.dart' show MarcacionAsistenciaWidget;
import 'package:flutter/material.dart';

class MarcacionAsistenciaModel
    extends FlutterFlowModel<MarcacionAsistenciaWidget> {
  ///  Local state fields for this page.

  DateTime? timeClock;

  DateTime? checkInTime;

  DateTime? checkOutTime;

  bool isCheckIn = true;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
