import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dialog_endereco_usuario_widget.dart' show DialogEnderecoUsuarioWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class DialogEnderecoUsuarioModel
    extends FlutterFlowModel<DialogEnderecoUsuarioWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextFieldCep widget.
  FocusNode? textFieldCepFocusNode;
  TextEditingController? textFieldCepController;
  final textFieldCepMask = MaskTextInputFormatter(mask: '#####-###');
  String? Function(BuildContext, String?)? textFieldCepControllerValidator;
  String? _textFieldCepControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    if (val.length < 9) {
      return 'CEP inválido';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (apiBuscarCep)] action in TextFieldCep widget.
  ApiCallResponse? responseApiBuscarCep;
  // State field(s) for TextFieldLogradouro widget.
  FocusNode? textFieldLogradouroFocusNode;
  TextEditingController? textFieldLogradouroController;
  String? Function(BuildContext, String?)?
      textFieldLogradouroControllerValidator;
  String? _textFieldLogradouroControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for TextFieldBairro widget.
  FocusNode? textFieldBairroFocusNode;
  TextEditingController? textFieldBairroController;
  String? Function(BuildContext, String?)? textFieldBairroControllerValidator;
  String? _textFieldBairroControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for TextFieldCidade widget.
  FocusNode? textFieldCidadeFocusNode;
  TextEditingController? textFieldCidadeController;
  String? Function(BuildContext, String?)? textFieldCidadeControllerValidator;
  String? _textFieldCidadeControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for TextFieldUF widget.
  FocusNode? textFieldUFFocusNode;
  TextEditingController? textFieldUFController;
  String? Function(BuildContext, String?)? textFieldUFControllerValidator;
  String? _textFieldUFControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textFieldCepControllerValidator = _textFieldCepControllerValidator;
    textFieldLogradouroControllerValidator =
        _textFieldLogradouroControllerValidator;
    textFieldBairroControllerValidator = _textFieldBairroControllerValidator;
    textFieldCidadeControllerValidator = _textFieldCidadeControllerValidator;
    textFieldUFControllerValidator = _textFieldUFControllerValidator;
  }

  void dispose() {
    textFieldCepFocusNode?.dispose();
    textFieldCepController?.dispose();

    textFieldLogradouroFocusNode?.dispose();
    textFieldLogradouroController?.dispose();

    textFieldBairroFocusNode?.dispose();
    textFieldBairroController?.dispose();

    textFieldCidadeFocusNode?.dispose();
    textFieldCidadeController?.dispose();

    textFieldUFFocusNode?.dispose();
    textFieldUFController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
