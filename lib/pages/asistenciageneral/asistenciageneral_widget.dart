import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'asistenciageneral_model.dart';
export 'asistenciageneral_model.dart';

class AsistenciageneralWidget extends StatefulWidget {
  const AsistenciageneralWidget({
    super.key,
    required this.qr,
  });

  final String? qr;

  @override
  State<AsistenciageneralWidget> createState() =>
      _AsistenciageneralWidgetState();
}

class _AsistenciageneralWidgetState extends State<AsistenciageneralWidget> {
  late AsistenciageneralModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AsistenciageneralModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.asistenciaOutput = await queryAsistenciaRecordOnce(
        queryBuilder: (asistenciaRecord) => asistenciaRecord.where(
          'checkin',
          isGreaterThan: functions.getTodayFirstHour(),
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.checkinOutput?.reference != null) {
        _model.checkInTime = _model.asistenciaOutput?.checkin;
        _model.checkOutTime = _model.asistenciaOutput?.checkout;
        _model.isCheckIn = true;
        safeSetState(() {});
      }
      _model.instantTimer = InstantTimer.periodic(
        duration: const Duration(milliseconds: 1000),
        callback: (timer) async {
          _model.timeClock = getCurrentTimestamp;
          safeSetState(() {});
        },
        startImmediately: true,
      );
    });

    _model.textController ??= TextEditingController();
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
          backgroundColor: FlutterFlowTheme.of(context).primary,
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
              color: FlutterFlowTheme.of(context).secondaryBackground,
              size: 24.0,
            ),
          ),
          title: Text(
            'Asistencia de Personal Diaria',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          dateTimeFormat(
                            "jms",
                            _model.timeClock,
                            locale: FFLocalizations.of(context).languageCode,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Outfit',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                        child: StreamBuilder<List<CosechadoresRecord>>(
                          stream: queryCosechadoresRecord(),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 40.0,
                                  height: 40.0,
                                  child: SpinKitSpinningCircle(
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 40.0,
                                  ),
                                ),
                              );
                            }
                            List<CosechadoresRecord>
                                textFieldCosechadoresRecordList =
                                snapshot.data!;

                            return Autocomplete<String>(
                              initialValue: const TextEditingValue(),
                              optionsBuilder: (textEditingValue) {
                                if (textEditingValue.text == '') {
                                  return const Iterable<String>.empty();
                                }
                                return textFieldCosechadoresRecordList
                                    .map((e) => e.nombrescosechador)
                                    .toList()
                                    .where((option) {
                                  final lowercaseOption = option.toLowerCase();
                                  return lowercaseOption.contains(
                                      textEditingValue.text.toLowerCase());
                                });
                              },
                              optionsViewBuilder:
                                  (context, onSelected, options) {
                                return AutocompleteOptionsList(
                                  textFieldKey: _model.textFieldKey,
                                  textController: _model.textController!,
                                  options: options.toList(),
                                  onSelected: onSelected,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        letterSpacing: 0.0,
                                      ),
                                  textHighlightStyle: const TextStyle(),
                                  elevation: 4.0,
                                  optionBackgroundColor:
                                      FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                  optionHighlightColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                  maxHeight: 200.0,
                                );
                              },
                              onSelected: (String selection) {
                                safeSetState(() =>
                                    _model.textFieldSelectedOption = selection);
                                FocusScope.of(context).unfocus();
                              },
                              fieldViewBuilder: (
                                context,
                                textEditingController,
                                focusNode,
                                onEditingComplete,
                              ) {
                                _model.textFieldFocusNode = focusNode;

                                _model.textController = textEditingController;
                                return TextFormField(
                                  key: _model.textFieldKey,
                                  controller: textEditingController,
                                  focusNode: focusNode,
                                  onEditingComplete: onEditingComplete,
                                  autofocus: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText:
                                        'Digita el nombre del personal...',
                                    labelStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                    hintStyle: FlutterFlowTheme.of(context)
                                        .labelMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        letterSpacing: 0.0,
                                      ),
                                  validator: _model.textControllerValidator
                                      .asValidator(context),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            StreamBuilder<List<AsistenciaRecord>>(
                              stream: queryAsistenciaRecord(),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 40.0,
                                      height: 40.0,
                                      child: SpinKitSpinningCircle(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 40.0,
                                      ),
                                    ),
                                  );
                                }
                                List<AsistenciaRecord>
                                    buttonAsistenciaRecordList = snapshot.data!;

                                return FFButtonWidget(
                                  onPressed: () async {
                                    _model.mm =
                                        await FlutterBarcodeScanner.scanBarcode(
                                      '#C62828', // scanning line color
                                      'Cancel', // cancel button text
                                      true, // whether to show the flash icon
                                      ScanMode.QR,
                                    );

                                    var asistenciaRecordReference =
                                        AsistenciaRecord.collection.doc();
                                    await asistenciaRecordReference.set({
                                      ...createAsistenciaRecordData(
                                        cosechadores:
                                            _model.textController.text,
                                        asistenciapersona: currentUserReference,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'checkin':
                                              FieldValue.serverTimestamp(),
                                        },
                                      ),
                                    });
                                    _model.checkinOutput =
                                        AsistenciaRecord.getDocumentFromData({
                                      ...createAsistenciaRecordData(
                                        cosechadores:
                                            _model.textController.text,
                                        asistenciapersona: currentUserReference,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'checkin': DateTime.now(),
                                        },
                                      ),
                                    }, asistenciaRecordReference);
                                    _model.isCheckIn = true;
                                    _model.checkInTime = getCurrentTimestamp;
                                    safeSetState(() {});

                                    safeSetState(() {});
                                  },
                                  text: 'Check in',
                                  icon: const Icon(
                                    Icons.check_circle,
                                    size: 15.0,
                                  ),
                                  options: FFButtonOptions(
                                    height: 47.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Check In at',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Text(
                              valueOrDefault<String>(
                                dateTimeFormat(
                                  "jm",
                                  _model.checkInTime,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                '--:--',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 100.0,
                          child: VerticalDivider(
                            thickness: 1.0,
                            color: FlutterFlowTheme.of(context).secondaryText,
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Check Out at',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Text(
                              valueOrDefault<String>(
                                dateTimeFormat(
                                  "jm",
                                  _model.checkOutTime,
                                  locale:
                                      FFLocalizations.of(context).languageCode,
                                ),
                                '--:--',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Outfit',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ].addToEnd(const SizedBox(height: 100.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
