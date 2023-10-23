import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/cadastro_page/cadastro_page_widget.dart';
import '/pages/home_page/home_page_widget.dart';
import 'login_page_widget.dart' show LoginPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPageModel extends FlutterFlowModel<LoginPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for TextEmailLogin widget.
  FocusNode? textEmailLoginFocusNode;
  TextEditingController? textEmailLoginController;
  String? Function(BuildContext, String?)? textEmailLoginControllerValidator;
  String? _textEmailLoginControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for TextSenhaLogin widget.
  FocusNode? textSenhaLoginFocusNode;
  TextEditingController? textSenhaLoginController;
  late bool textSenhaLoginVisibility;
  String? Function(BuildContext, String?)? textSenhaLoginControllerValidator;
  String? _textSenhaLoginControllerValidator(
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
    textEmailLoginControllerValidator = _textEmailLoginControllerValidator;
    textSenhaLoginVisibility = false;
    textSenhaLoginControllerValidator = _textSenhaLoginControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    textEmailLoginFocusNode?.dispose();
    textEmailLoginController?.dispose();

    textSenhaLoginFocusNode?.dispose();
    textSenhaLoginController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
