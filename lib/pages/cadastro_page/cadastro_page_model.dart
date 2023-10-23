import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/home_page/home_page_widget.dart';
import 'cadastro_page_widget.dart' show CadastroPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CadastroPageModel extends FlutterFlowModel<CadastroPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for FieldNameCadastro widget.
  FocusNode? fieldNameCadastroFocusNode;
  TextEditingController? fieldNameCadastroController;
  String? Function(BuildContext, String?)? fieldNameCadastroControllerValidator;
  String? _fieldNameCadastroControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for FieldEmailCadastro widget.
  FocusNode? fieldEmailCadastroFocusNode;
  TextEditingController? fieldEmailCadastroController;
  String? Function(BuildContext, String?)?
      fieldEmailCadastroControllerValidator;
  String? _fieldEmailCadastroControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for FieldSenhaCadastro widget.
  FocusNode? fieldSenhaCadastroFocusNode;
  TextEditingController? fieldSenhaCadastroController;
  late bool fieldSenhaCadastroVisibility;
  String? Function(BuildContext, String?)?
      fieldSenhaCadastroControllerValidator;
  String? _fieldSenhaCadastroControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (val.length < 6) {
      return 'Deve conter no mínimo 6 caracteres';
    }

    return null;
  }

  // State field(s) for FieldConfirmeSenhaCadastro widget.
  FocusNode? fieldConfirmeSenhaCadastroFocusNode;
  TextEditingController? fieldConfirmeSenhaCadastroController;
  late bool fieldConfirmeSenhaCadastroVisibility;
  String? Function(BuildContext, String?)?
      fieldConfirmeSenhaCadastroControllerValidator;
  String? _fieldConfirmeSenhaCadastroControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (val.length < 6) {
      return 'Deve conter no mínimo 6 caracteres';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    fieldNameCadastroControllerValidator =
        _fieldNameCadastroControllerValidator;
    fieldEmailCadastroControllerValidator =
        _fieldEmailCadastroControllerValidator;
    fieldSenhaCadastroVisibility = false;
    fieldSenhaCadastroControllerValidator =
        _fieldSenhaCadastroControllerValidator;
    fieldConfirmeSenhaCadastroVisibility = false;
    fieldConfirmeSenhaCadastroControllerValidator =
        _fieldConfirmeSenhaCadastroControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    fieldNameCadastroFocusNode?.dispose();
    fieldNameCadastroController?.dispose();

    fieldEmailCadastroFocusNode?.dispose();
    fieldEmailCadastroController?.dispose();

    fieldSenhaCadastroFocusNode?.dispose();
    fieldSenhaCadastroController?.dispose();

    fieldConfirmeSenhaCadastroFocusNode?.dispose();
    fieldConfirmeSenhaCadastroController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
