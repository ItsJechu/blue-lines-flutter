import '/flutter_flow/flutter_flow_util.dart';
import '/pages/selectordefundo/selectordefundo_widget.dart';
import 'selectordefundo_copy_widget.dart' show SelectordefundoCopyWidget;
import 'package:flutter/material.dart';

class SelectordefundoCopyModel
    extends FlutterFlowModel<SelectordefundoCopyWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for selectordefundo component.
  late SelectordefundoModel selectordefundoModel;

  @override
  void initState(BuildContext context) {
    selectordefundoModel = createModel(context, () => SelectordefundoModel());
  }

  @override
  void dispose() {
    selectordefundoModel.dispose();
  }
}
