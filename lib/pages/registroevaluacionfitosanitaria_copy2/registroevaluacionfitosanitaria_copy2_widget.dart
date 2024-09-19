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
import 'registroevaluacionfitosanitaria_copy2_model.dart';
export 'registroevaluacionfitosanitaria_copy2_model.dart';

class RegistroevaluacionfitosanitariaCopy2Widget extends StatefulWidget {
  const RegistroevaluacionfitosanitariaCopy2Widget({
    super.key,
    this.userProfile,
    required this.fundo,
  });

  final DocumentReference? userProfile;
  final String? fundo;

  @override
  State<RegistroevaluacionfitosanitariaCopy2Widget> createState() =>
      _RegistroevaluacionfitosanitariaCopy2WidgetState();
}

class _RegistroevaluacionfitosanitariaCopy2WidgetState
    extends State<RegistroevaluacionfitosanitariaCopy2Widget> {
  late RegistroevaluacionfitosanitariaCopy2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model =
        createModel(context, () => RegistroevaluacionfitosanitariaCopy2Model());

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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).success,
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
          'Registro de Evaluación Fitosanitaria',
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
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Outfit',
                          letterSpacing: 0.0,
                        ),
                    hintText: 'Seleccionar Variedad :',
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: FlutterFlowTheme.of(context).primaryText,
                    borderWidth: 1.0,
                    borderRadius: 8.0,
                    margin:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 5.0, 24.0, 5.0),
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
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0.0,
                                ),
                        hintText: 'Seleccionar Lote / Módulo :',
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 2.0,
                        borderColor: FlutterFlowTheme.of(context).primaryText,
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
                      queryBuilder: (grupoladoRecord) => grupoladoRecord.where(
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
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0.0,
                                ),
                        hintText: 'Seleccionar Grupo/Lado/Turno',
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 2.0,
                        borderColor: FlutterFlowTheme.of(context).primaryText,
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
                      List<SectorvalvuRecord> secvalvuSectorvalvuRecordList =
                          snapshot.data!;

                      return FlutterFlowDropDown<String>(
                        controller: _model.secvalvuValueController1 ??=
                            FormFieldController<String>(null),
                        options: secvalvuSectorvalvuRecordList
                            .map((e) => e.sectorvalvuName)
                            .toList(),
                        onChanged: (val) =>
                            safeSetState(() => _model.secvalvuValue1 = val),
                        width: 353.0,
                        height: 57.0,
                        textStyle:
                            FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Outfit',
                                  letterSpacing: 0.0,
                                ),
                        hintText: 'Seleccionar Sectores/Válvulas',
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 2.0,
                        borderColor: FlutterFlowTheme.of(context).primaryText,
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
                    controller: _model.secvalvuValueController2 ??=
                        FormFieldController<String>(null),
                    options: const [
                      'Chloridea virescens - posturas / Planta\n',
                      'Chloridea virescens - larvas chicas / Planta\n',
                      'Chloridea virescens - larvas grandes / Planta\n',
                      'Thrips ninfas + adultos / Brote\n',
                      'Thrips ninfas + adultos / Flor\n',
                      'Pinnaspis aspidistrae / Incidencia\n',
                      'Cryptocephalus castaneus / Brotes\n',
                      'Cryptocephalus castaneus / Flores\n',
                      'Cryptocephalus castaneus / Frutos\n',
                      'Alternaria sp. / Incidencia\n',
                      'Cochinilla harinosa / Brotes \n',
                      'Cochinilla harinosa / Ramas\n',
                      'Cochinilla harinosa / Flores\n',
                      'Cochinilla harinosa / Frutos\n',
                      'Bemisia tabaci - Grado / Planta\n',
                      'Aleurodicus juleikae - Grado / Planta\n',
                      'Aphis gossypii / Brotes\n',
                      'Aphis gossypii / Flores\n',
                      'Aphis gossypii / Frutos\n',
                      'Oligonychus punicae - Grado / Planta\n',
                      'Coccus hesperidum / Incidencia\n',
                      'Hemiberlesia lataniae / Incidencia\n',
                      'Icerya purchasi / Incidencia\n',
                      'Lasiodiplodia theobromae / Incidencia\n',
                      'Verticilum sp. / Incidencia\n',
                      'Oidium - Grado / Planta\n',
                      'Botrytis sp. / Incidencia\n',
                      'Roya - Grado / Planta\n',
                      'Anómala sp. / Incidencia\n',
                      'Empoasca sp. - Grado / planta\n',
                      'Nabis sp. / Incidencia\n',
                      'Zelus sp. / Incidencia\n',
                      'Coccinelidos / Incidencia\n',
                      'Chrysoperla sp. / Incidencia\n',
                      'Amblyseius sp. / Incidencia\n',
                      'Anagyrus sp. / Incidencia\n',
                      'Podius sp. / Incidencia\n',
                      'Cryptolaemus montrouzieri / Incidencia\n',
                      'Trichograma sp. /Incidencia\n',
                      'Arañas / Incidencia\n',
                      'Argyrotaenia sphaleropa - larvas / planta\n'
                    ],
                    onChanged: (val) =>
                        safeSetState(() => _model.secvalvuValue2 = val),
                    width: 353.0,
                    height: 57.0,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Outfit',
                          letterSpacing: 0.0,
                        ),
                    hintText: 'Plaga Enfermedad / Etapa Órgano :',
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: FlutterFlowTheme.of(context).primaryText,
                    borderWidth: 1.0,
                    borderRadius: 8.0,
                    margin:
                        const EdgeInsetsDirectional.fromSTEB(24.0, 5.0, 24.0, 5.0),
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
                        borderSide: const BorderSide(
                          color: Color(0x00000000),
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
                      fillColor: FlutterFlowTheme.of(context).primaryBackground,
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
                      labelText: 'Grado ó Número de Individuos:',
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
                          color: Color(0x00000000),
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
                      fillColor: FlutterFlowTheme.of(context).primaryBackground,
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
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
                          await SQLiteManager.instance.agregarRegistro(
                            tipovariedad: _model.variedadValue!,
                            lote: _model.lotemodValue!,
                            valvula: _model.grupoladValue!,
                            plagetapa: _model.secvalvuValue1!,
                            grado: _model.gradoTextController.text,
                            nroplanta: _model.nroplantaTextController.text,
                            enfermedad: _model.secvalvuValue2!,
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
                          color: FlutterFlowTheme.of(context).success,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
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
                          await actions.exportToCSV();
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                content:
                                    const Text('Registro exportado exitosamente!'),
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
                          color: FlutterFlowTheme.of(context).success,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
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
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
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
                          await SQLiteManager.instance.eliminarregistro();
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
                          color: FlutterFlowTheme.of(context).success,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
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
  }
}
