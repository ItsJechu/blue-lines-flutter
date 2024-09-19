import '/flutter_flow/flutter_flow_util.dart';
import '/pages/selectordefundo/selectordefundo_widget.dart';
import 'package:flutter/material.dart';
import 'selectordefundo_copy_model.dart';
export 'selectordefundo_copy_model.dart';

class SelectordefundoCopyWidget extends StatefulWidget {
  const SelectordefundoCopyWidget({
    super.key,
    this.fundo,
  });

  final String? fundo;

  @override
  State<SelectordefundoCopyWidget> createState() =>
      _SelectordefundoCopyWidgetState();
}

class _SelectordefundoCopyWidgetState extends State<SelectordefundoCopyWidget> {
  late SelectordefundoCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectordefundoCopyModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return wrapWithModel(
      model: _model.selectordefundoModel,
      updateCallback: () => safeSetState(() {}),
      child: const SelectordefundoWidget(),
    );
  }
}
