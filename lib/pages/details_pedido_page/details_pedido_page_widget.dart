import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/chat_page/chat_page_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'details_pedido_page_model.dart';
export 'details_pedido_page_model.dart';

class DetailsPedidoPageWidget extends StatefulWidget {
  const DetailsPedidoPageWidget({
    Key? key,
    required this.pedidoDetailDocument,
  }) : super(key: key);

  final PedidoRecord? pedidoDetailDocument;

  @override
  _DetailsPedidoPageWidgetState createState() =>
      _DetailsPedidoPageWidgetState();
}

class _DetailsPedidoPageWidgetState extends State<DetailsPedidoPageWidget> {
  late DetailsPedidoPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DetailsPedidoPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return StreamBuilder<List<UsuariosRecord>>(
      stream: queryUsuariosRecord(
        queryBuilder: (usuariosRecord) => usuariosRecord.where(
          'uid',
          isEqualTo: () {
            if ((widget.pedidoDetailDocument?.status == 1) &&
                (widget.pedidoDetailDocument?.userUid == currentUserUid)) {
              return widget.pedidoDetailDocument?.negociadorUid;
            } else if ((widget.pedidoDetailDocument?.status == 1) &&
                (widget.pedidoDetailDocument?.userUid != currentUserUid)) {
              return widget.pedidoDetailDocument?.userUid;
            } else {
              return currentUserUid;
            }
          }(),
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).info,
                  ),
                ),
              ),
            ),
          );
        }
        List<UsuariosRecord> detailsPedidoPageUsuariosRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final detailsPedidoPageUsuariosRecord =
            detailsPedidoPageUsuariosRecordList.isNotEmpty
                ? detailsPedidoPageUsuariosRecordList.first
                : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
              title: Text(
                valueOrDefault<String>(
                  widget.pedidoDetailDocument?.name,
                  'Nenhum',
                ),
                maxLines: 1,
                style: FlutterFlowTheme.of(context).headlineMedium,
              ),
              actions: [
                Visibility(
                  visible:
                      widget.pedidoDetailDocument?.userUid == currentUserUid,
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 20.0,
                    borderWidth: 1.0,
                    buttonSize: 60.0,
                    icon: Icon(
                      Icons.delete,
                      color: FlutterFlowTheme.of(context).alternate,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      var confirmDialogResponse = await showDialog<bool>(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Excluir pedido'),
                                content: Text(
                                    'Deseja excluir o pedido? Ao apertar em sim, não será possível desfazer a ação!'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(
                                        alertDialogContext, false),
                                    child: Text('Não'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext, true),
                                    child: Text('Sim'),
                                  ),
                                ],
                              );
                            },
                          ) ??
                          false;
                      if (confirmDialogResponse) {
                        await widget.pedidoDetailDocument!.reference.delete();
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
              ],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          valueOrDefault<String>(
                            widget.pedidoDetailDocument?.urlImage,
                            'https://firebasestorage.googleapis.com/v0/b/delivery-service-c8b2f.appspot.com/o/users%2Fqjg0Zcns0aRqPoQFpZlvC5JBXNj1%2Fuploads%2F1697658303315000.png?alt=media&token=cecba1c1-d8a2-4f79-9c46-94450032ccc1',
                          ),
                          width: double.infinity,
                          height: 250.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 8.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 12.0, 12.0, 12.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                valueOrDefault<String>(
                                  widget.pedidoDetailDocument?.description,
                                  'Nenhum',
                                ),
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                              Stack(
                                children: [
                                  if ((widget.pedidoDetailDocument?.status ==
                                          0) &&
                                      (widget.pedidoDetailDocument?.userUid !=
                                          currentUserUid))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 12.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await widget
                                              .pedidoDetailDocument!.reference
                                              .update(createPedidoRecordData(
                                            status: 1,
                                            negociadorUid: currentUserUid,
                                          ));
                                          _model.usuarioNegociarChat =
                                              await queryUsuariosRecordOnce(
                                            queryBuilder: (usuariosRecord) =>
                                                usuariosRecord.where(
                                              'uid',
                                              isEqualTo: widget
                                                          .pedidoDetailDocument
                                                          ?.userUid ==
                                                      currentUserUid
                                                  ? widget.pedidoDetailDocument
                                                      ?.negociadorUid
                                                  : widget.pedidoDetailDocument
                                                      ?.userUid,
                                            ),
                                            singleRecord: true,
                                          ).then((s) => s.firstOrNull);
                                          setState(() {});
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ChatPageWidget(
                                                chatUser:
                                                    _model.usuarioNegociarChat,
                                              ),
                                            ),
                                          );

                                          setState(() {});
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 70.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  12.0,
                                                                  0.0,
                                                                  12.0),
                                                      child: Icon(
                                                        Icons.work_history,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Negociar',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  if ((widget.pedidoDetailDocument?.status ==
                                          1) &&
                                      (widget.pedidoDetailDocument
                                              ?.negociadorUid ==
                                          currentUserUid))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 12.0, 0.0, 12.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await widget
                                              .pedidoDetailDocument!.reference
                                              .update(createPedidoRecordData(
                                            status: 0,
                                            negociadorUid: '',
                                          ));
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          height: 70.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  12.0,
                                                                  0.0,
                                                                  12.0),
                                                      child: Icon(
                                                        Icons.work_off,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .error,
                                                        size: 24.0,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Cancelar negociação',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (widget.pedidoDetailDocument?.status == 1)
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  2.0, 2.0, 2.0, 2.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: Image.network(
                                  detailsPedidoPageUsuariosRecord!.photoUrl,
                                  width: 50.0,
                                  height: 50.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.00, -1.00),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  valueOrDefault<String>(
                                    detailsPedidoPageUsuariosRecord?.name,
                                    'usuario',
                                  ),
                                  maxLines: 1,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (widget.pedidoDetailDocument?.status == 1)
                          FFButtonWidget(
                            onPressed: () async {
                              _model.usuarioChat =
                                  await queryUsuariosRecordOnce(
                                queryBuilder: (usuariosRecord) =>
                                    usuariosRecord.where(
                                  'uid',
                                  isEqualTo: widget
                                              .pedidoDetailDocument?.userUid ==
                                          currentUserUid
                                      ? widget
                                          .pedidoDetailDocument?.negociadorUid
                                      : widget.pedidoDetailDocument?.userUid,
                                ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  duration: Duration(milliseconds: 300),
                                  reverseDuration: Duration(milliseconds: 300),
                                  child: ChatPageWidget(
                                    chatUser: _model.usuarioChat,
                                  ),
                                ),
                              );

                              setState(() {});
                            },
                            text: 'chat',
                            icon: Icon(
                              Icons.people,
                              size: 15.0,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                      ],
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
