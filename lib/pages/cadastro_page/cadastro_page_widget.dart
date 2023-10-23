import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/home_page/home_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cadastro_page_model.dart';
export 'cadastro_page_model.dart';

class CadastroPageWidget extends StatefulWidget {
  const CadastroPageWidget({Key? key}) : super(key: key);

  @override
  _CadastroPageWidgetState createState() => _CadastroPageWidgetState();
}

class _CadastroPageWidgetState extends State<CadastroPageWidget> {
  late CadastroPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CadastroPageModel());

    _model.fieldNameCadastroController ??= TextEditingController();
    _model.fieldNameCadastroFocusNode ??= FocusNode();
    _model.fieldEmailCadastroController ??= TextEditingController();
    _model.fieldEmailCadastroFocusNode ??= FocusNode();
    _model.fieldSenhaCadastroController ??= TextEditingController();
    _model.fieldSenhaCadastroFocusNode ??= FocusNode();
    _model.fieldConfirmeSenhaCadastroController ??= TextEditingController();
    _model.fieldConfirmeSenhaCadastroFocusNode ??= FocusNode();
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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.00, -1.00),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset(
                    'assets/images/servicos-gerais-removebg-preview.png',
                    width: double.infinity,
                    height: 240.0,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 16.0, 0.0),
                          child: Text(
                            'Faça Seu Cadastro',
                            style: FlutterFlowTheme.of(context).headlineMedium,
                          ),
                        ),
                        Form(
                          key: _model.formKey,
                          autovalidateMode: AutovalidateMode.always,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 0.0),
                                child: TextFormField(
                                  controller:
                                      _model.fieldNameCadastroController,
                                  focusNode: _model.fieldNameCadastroFocusNode,
                                  textCapitalization: TextCapitalization.words,
                                  textInputAction: TextInputAction.next,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Nome',
                                    hintText: 'Como devemos lhe chamar?',
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyLarge,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  keyboardType: TextInputType.name,
                                  validator: _model
                                      .fieldNameCadastroControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 24.0, 0.0, 0.0),
                                child: TextFormField(
                                  controller:
                                      _model.fieldEmailCadastroController,
                                  focusNode: _model.fieldEmailCadastroFocusNode,
                                  textInputAction: TextInputAction.next,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'E-mail',
                                    hintText: 'Informe seu e-mail',
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyLarge,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: _model
                                      .fieldEmailCadastroControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: TextFormField(
                                  controller:
                                      _model.fieldSenhaCadastroController,
                                  focusNode: _model.fieldSenhaCadastroFocusNode,
                                  textInputAction: TextInputAction.next,
                                  obscureText:
                                      !_model.fieldSenhaCadastroVisibility,
                                  decoration: InputDecoration(
                                    labelText: 'Senha (Mínimo de 6 caracteres)',
                                    hintText: 'Digite sua senha',
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyLarge,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    suffixIcon: InkWell(
                                      onTap: () => setState(
                                        () => _model
                                                .fieldSenhaCadastroVisibility =
                                            !_model
                                                .fieldSenhaCadastroVisibility,
                                      ),
                                      focusNode: FocusNode(skipTraversal: true),
                                      child: Icon(
                                        _model.fieldSenhaCadastroVisibility
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 22.0,
                                      ),
                                    ),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  validator: _model
                                      .fieldSenhaCadastroControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: TextFormField(
                                  controller: _model
                                      .fieldConfirmeSenhaCadastroController,
                                  focusNode: _model
                                      .fieldConfirmeSenhaCadastroFocusNode,
                                  textInputAction: TextInputAction.go,
                                  obscureText: !_model
                                      .fieldConfirmeSenhaCadastroVisibility,
                                  decoration: InputDecoration(
                                    labelText: 'Senha (Mínimo de 6 caracteres)',
                                    hintText: 'Confirme sua senha',
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyLarge,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    suffixIcon: InkWell(
                                      onTap: () => setState(
                                        () => _model
                                                .fieldConfirmeSenhaCadastroVisibility =
                                            !_model
                                                .fieldConfirmeSenhaCadastroVisibility,
                                      ),
                                      focusNode: FocusNode(skipTraversal: true),
                                      child: Icon(
                                        _model.fieldConfirmeSenhaCadastroVisibility
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 22.0,
                                      ),
                                    ),
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  validator: _model
                                      .fieldConfirmeSenhaCadastroControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              if (_model.formKey.currentState == null ||
                                  !_model.formKey.currentState!.validate()) {
                                return;
                              }
                              if (_model.fieldSenhaCadastroController.text !=
                                  _model.fieldConfirmeSenhaCadastroController
                                      .text) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Passwords don\'t match!',
                                    ),
                                  ),
                                );
                                return;
                              }

                              final user =
                                  await authManager.createAccountWithEmail(
                                context,
                                _model.fieldEmailCadastroController.text,
                                _model.fieldSenhaCadastroController.text,
                              );
                              if (user == null) {
                                return;
                              }

                              await UsuariosRecord.collection
                                  .doc(user.uid)
                                  .update(createUsuariosRecordData(
                                    email: _model
                                        .fieldEmailCadastroController.text,
                                    name:
                                        _model.fieldNameCadastroController.text,
                                    photoUrl:
                                        'https://firebasestorage.googleapis.com/v0/b/delivery-service-c8b2f.appspot.com/o/photos%2Fusuario.jpg?alt=media&token=200e851c-d8fa-4d8b-8a9e-387cc179e30c&_gl=1*rt5dge*_ga*MjQ0MjM4NDkwLjE2OTc2MjkzODI.*_ga_CW55HF8NVT*MTY5NzcyNTAyMS44LjEuMTY5NzcyNTM2OS42MC4wLjA.',
                                  ));

                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePageWidget(),
                                ),
                                (r) => false,
                              );
                            },
                            text: 'Criar Conta',
                            options: FFButtonOptions(
                              width: 370.0,
                              height: 44.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                  ),
                              elevation: 3.0,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                            text: 'Já tenho uma conta',
                            options: FFButtonOptions(
                              width: 370.0,
                              height: 44.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
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
      ),
    );
  }
}
