import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'perfil_qr_model.dart';
export 'perfil_qr_model.dart';

class PerfilQrWidget extends StatefulWidget {
  const PerfilQrWidget({
    super.key,
    required this.cosechadornombre,
    required this.cosechadordni,
  });

  final String? cosechadornombre;
  final String? cosechadordni;

  @override
  State<PerfilQrWidget> createState() => _PerfilQrWidgetState();
}

class _PerfilQrWidgetState extends State<PerfilQrWidget> {
  late PerfilQrModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PerfilQrModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: const Color(0xFF12435A),
          automaticallyImplyLeading: false,
          leading: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.safePop();
            },
            child: Icon(
              Icons.chevron_left,
              color: FlutterFlowTheme.of(context).alternate,
              size: 32.0,
            ),
          ),
          title: Text(
            'Carnet Digital',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 10.0),
              child: FFButtonWidget(
                onPressed: () async {
                  await actions.generatePDFCopyCopy(
                    widget.cosechadornombre!,
                    widget.cosechadordni!,
                  );
                },
                text: 'PDF',
                icon: const Icon(
                  Icons.download_sharp,
                  size: 15.0,
                ),
                options: FFButtonOptions(
                  height: 21.0,
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: const Color(0xFF55ADAD),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Outfit',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 60.0, 20.0, 0.0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 29.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    width: 381.0,
                    height: 600.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(10.0),
                      shape: BoxShape.rectangle,
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 30.0, 0.0, 0.0),
                          child: Stack(
                            children: [
                              Align(
                                alignment: const AlignmentDirectional(-1.48, -1.25),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      145.0, 400.0, 0.0, 0.0),
                                  child: BarcodeWidget(
                                    data: widget.cosechadornombre!,
                                    barcode: Barcode.qrCode(),
                                    width: 150.0,
                                    height: 150.0,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    backgroundColor: Colors.transparent,
                                    errorBuilder: (context, error) =>
                                        const SizedBox(
                                      width: 150.0,
                                      height: 150.0,
                                    ),
                                    drawText: false,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.04, 0.0),
                          child: Container(
                            width: 81.0,
                            height: 650.0,
                            decoration: const BoxDecoration(
                              color: Color(0xFF0C214A),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(0.0),
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(0.0),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-2.11, -0.68),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                155.0, 70.0, 0.0, 0.0),
                            child: Container(
                              width: 150.0,
                              height: 150.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                'assets/images/hombre.png',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.52, 0.27),
                          child: Container(
                            width: 234.0,
                            height: 126.0,
                            decoration: const BoxDecoration(),
                            child: Text(
                              valueOrDefault<String>(
                                widget.cosechadornombre,
                                '-.-',
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .displayLarge
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 27.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0.19, -0.93),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/27512705_7352470.jpg',
                              width: 133.0,
                              height: 100.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
