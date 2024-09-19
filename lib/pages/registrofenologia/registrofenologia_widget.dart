import '/backend/backend.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'registrofenologia_model.dart';
export 'registrofenologia_model.dart';

class RegistrofenologiaWidget extends StatefulWidget {
  const RegistrofenologiaWidget({
    super.key,
    this.userProfile,
  });

  final DocumentReference? userProfile;

  @override
  State<RegistrofenologiaWidget> createState() =>
      _RegistrofenologiaWidgetState();
}

class _RegistrofenologiaWidgetState extends State<RegistrofenologiaWidget> {
  late RegistrofenologiaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RegistrofenologiaModel());

    _model.nroplantaTextController ??= TextEditingController();
    _model.nroplantaFocusNode ??= FocusNode();

    _model.gradoTextController ??= TextEditingController();
    _model.gradoFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<EvafitosanitariaRecord>>(
      stream: queryEvafitosanitariaRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: SpinKitSpinningCircle(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 40.0,
                ),
              ),
            ),
          );
        }
        List<EvafitosanitariaRecord>
            registrofenologiaEvafitosanitariaRecordList = snapshot.data!;

        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: AppBar(
            backgroundColor: const Color(0xFF19B28D),
            automaticallyImplyLeading: false,
            leading: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pop();
              },
              child: Icon(
                Icons.chevron_left_rounded,
                color: FlutterFlowTheme.of(context).alternate,
                size: 32.0,
              ),
            ),
            title: Text(
              'INVESTIGACIÓN Y DESARROLLO',
              style: FlutterFlowTheme.of(context).headlineSmall.override(
                    fontFamily: 'Outfit',
                    color: FlutterFlowTheme.of(context).alternate,
                    fontSize: 19.0,
                    letterSpacing: 0.0,
                  ),
            ),
            actions: const [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: const BoxDecoration(),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                      child: FlutterFlowDropDown<String>(
                        controller: _model.variedadValueController ??=
                            FormFieldController<String>(null),
                        options: const [
                          'Biloxi',
                          'Emerald',
                          'Atlas',
                          'Blue Madeira',
                          'Blue Manila',
                          'Ventura'
                        ],
                        onChanged: (val) =>
                            safeSetState(() => _model.variedadValue = val),
                        width: 353.0,
                        height: 57.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0.0,
                                ),
                        hintText: 'Seleccionar Variedad :',
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        fillColor: const Color(0xFFF1F4F8),
                        elevation: 5.0,
                        borderColor: Colors.transparent,
                        borderWidth: 1.0,
                        borderRadius: 8.0,
                        margin: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 5.0, 24.0, 5.0),
                        hidesUnderline: true,
                        isOverButton: true,
                        isSearchable: false,
                        isMultiSelect: false,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                      child: StreamBuilder<List<LotemodRecord>>(
                        stream: queryLotemodRecord(),
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
                          List<LotemodRecord> lotemodLotemodRecordList =
                              snapshot.data!;

                          return FlutterFlowDropDown<String>(
                            controller: _model.lotemodValueController ??=
                                FormFieldController<String>(null),
                            options: lotemodLotemodRecordList
                                .map((e) => e.name)
                                .toList(),
                            onChanged: (val) =>
                                safeSetState(() => _model.lotemodValue = val),
                            width: 353.0,
                            height: 57.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0.0,
                                ),
                            hintText: 'Seleccionar Lote / Módulo :',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            fillColor: const Color(0xFFF1F4F8),
                            elevation: 2.0,
                            borderColor: Colors.transparent,
                            borderWidth: 1.0,
                            borderRadius: 8.0,
                            margin: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 5.0, 24.0, 5.0),
                            hidesUnderline: true,
                            isOverButton: true,
                            isSearchable: false,
                            isMultiSelect: false,
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                      child: StreamBuilder<List<GrupoladoRecord>>(
                        stream: queryGrupoladoRecord(
                          queryBuilder: (grupoladoRecord) =>
                              grupoladoRecord.where(
                            'lotemodName',
                            isEqualTo: _model.lotemodValue,
                          ),
                        ),
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
                          List<GrupoladoRecord> grupoladGrupoladoRecordList =
                              snapshot.data!;

                          return FlutterFlowDropDown<String>(
                            controller: _model.grupoladValueController ??=
                                FormFieldController<String>(null),
                            options: grupoladGrupoladoRecordList
                                .map((e) => e.grupoladoName)
                                .toList(),
                            onChanged: (val) =>
                                safeSetState(() => _model.grupoladValue = val),
                            width: 353.0,
                            height: 57.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0.0,
                                ),
                            hintText: 'Seleccionar Grupo/Lado/Turno',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            fillColor: const Color(0xFFF1F4F8),
                            elevation: 2.0,
                            borderColor: Colors.transparent,
                            borderWidth: 1.0,
                            borderRadius: 8.0,
                            margin: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 5.0, 24.0, 5.0),
                            hidesUnderline: true,
                            isOverButton: true,
                            isSearchable: false,
                            isMultiSelect: false,
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                      child: StreamBuilder<List<SectorvalvuRecord>>(
                        stream: querySectorvalvuRecord(
                          queryBuilder: (sectorvalvuRecord) => sectorvalvuRecord
                              .where(
                                'grupoladoName',
                                isEqualTo: _model.grupoladValue,
                              )
                              .where(
                                'lotemodName',
                                isEqualTo: _model.lotemodValue,
                              ),
                        ),
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
                          List<SectorvalvuRecord>
                              secvalvuSectorvalvuRecordList = snapshot.data!;

                          return FlutterFlowDropDown<String>(
                            controller: _model.secvalvuValueController ??=
                                FormFieldController<String>(null),
                            options: secvalvuSectorvalvuRecordList
                                .map((e) => e.sectorvalvuName)
                                .toList(),
                            onChanged: (val) =>
                                safeSetState(() => _model.secvalvuValue = val),
                            width: 353.0,
                            height: 57.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0.0,
                                ),
                            hintText: 'Seleccionar Sectores/Válvulas',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            fillColor: const Color(0xFFF1F4F8),
                            elevation: 2.0,
                            borderColor: Colors.transparent,
                            borderWidth: 1.0,
                            borderRadius: 8.0,
                            margin: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 5.0, 24.0, 5.0),
                            hidesUnderline: true,
                            isOverButton: true,
                            isSearchable: false,
                            isMultiSelect: false,
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                      child: FlutterFlowDropDown<String>(
                        controller: _model.fenologiaValueController ??=
                            FormFieldController<String>(null),
                        options: const [
                          'Crecimiento de brotes\n',
                          'Conteo de brotes basales\n',
                          'Altura de planta\n',
                          'Conteo de brotes totales\n',
                          'Conteo de floración \n',
                          'Conteo de frutos\n'
                        ],
                        onChanged: (val) =>
                            safeSetState(() => _model.fenologiaValue = val),
                        width: 353.0,
                        height: 57.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0.0,
                                ),
                        hintText: 'Fenología :',
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        fillColor: const Color(0xFFF1F4F8),
                        elevation: 2.0,
                        borderColor: Colors.transparent,
                        borderWidth: 1.0,
                        borderRadius: 5.0,
                        margin: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 5.0, 24.0, 5.0),
                        hidesUnderline: true,
                        isOverButton: true,
                        isSearchable: false,
                        isMultiSelect: false,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                      child: TextFormField(
                        controller: _model.nroplantaTextController,
                        focusNode: _model.nroplantaFocusNode,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Nro. Planta :',
                          labelStyle:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Outfit',
                                    letterSpacing: 0.0,
                                  ),
                          hintStyle:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Outfit',
                                    letterSpacing: 0.0,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.of(context).primaryText,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 24.0, 20.0, 24.0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Outfit',
                              letterSpacing: 0.0,
                            ),
                        validator: _model.nroplantaTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                      child: TextFormField(
                        controller: _model.gradoTextController,
                        focusNode: _model.gradoFocusNode,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Cantidad:',
                          labelStyle:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Outfit',
                                    letterSpacing: 0.0,
                                  ),
                          hintStyle:
                              FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Outfit',
                                    letterSpacing: 0.0,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xD8141212),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 24.0, 20.0, 24.0),
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Outfit',
                              letterSpacing: 0.0,
                            ),
                        keyboardType: TextInputType.emailAddress,
                        validator: _model.gradoTextControllerValidator
                            .asValidator(context),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: StreamBuilder<List<EvafitosanitariaRecord>>(
                        stream: queryEvafitosanitariaRecord(),
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
                          List<EvafitosanitariaRecord>
                              buttonLoginEvafitosanitariaRecordList =
                              snapshot.data!;

                          return FFButtonWidget(
                            onPressed: () async {
                              await SQLiteManager.instance
                                  .agregarregistrofenologia(
                                tipovariedadf: _model.variedadValue!,
                                lotef: _model.lotemodValue!,
                                valvulaf: _model.grupoladValue!,
                                plagetapaf: _model.secvalvuValue!,
                                cantidadf: _model.gradoTextController.text,
                                nroplantaf: _model.nroplantaTextController.text,
                                fenologiaf: _model.fenologiaValue!,
                              );
                              safeSetState(() {
                                _model.gradoTextController?.clear();
                              });
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    content:
                                        const Text('Registro guardado exitosamente!'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            text: 'Guardar registro',
                            options: FFButtonOptions(
                              width: 230.0,
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: const Color(0xFF19B28D),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: StreamBuilder<List<EvafitosanitariaRecord>>(
                        stream: queryEvafitosanitariaRecord(),
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
                          List<EvafitosanitariaRecord>
                              buttonExportEvafitosanitariaRecordList =
                              snapshot.data!;

                          return FFButtonWidget(
                            onPressed: () async {
                              await actions.exportToCSVFenologia();
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    content: const Text(
                                        'Registro exportado exitosamente!'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            text: 'Exportar Datos',
                            options: FFButtonOptions(
                              width: 230.0,
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: const Color(0xFF19B28D),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                      child: StreamBuilder<List<EvafitosanitariaRecord>>(
                        stream: queryEvafitosanitariaRecord(),
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
                          List<EvafitosanitariaRecord>
                              buttonExportEvafitosanitariaRecordList =
                              snapshot.data!;

                          return FFButtonWidget(
                            onPressed: () async {
                              await SQLiteManager.instance.eliminarfenologia();
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    content: const Text('Lista creada exitosamente!'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: const Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            text: 'Crear nueva lista ',
                            options: FFButtonOptions(
                              width: 230.0,
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: const Color(0xFF19B28D),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Outfit',
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 3.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
