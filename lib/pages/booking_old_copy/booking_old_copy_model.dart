import '/flutter_flow/flutter_flow_util.dart';
import 'booking_old_copy_widget.dart' show BookingOldCopyWidget;
import 'package:flutter/material.dart';

class BookingOldCopyModel extends FlutterFlowModel<BookingOldCopyWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailTextController?.dispose();
  }
}
