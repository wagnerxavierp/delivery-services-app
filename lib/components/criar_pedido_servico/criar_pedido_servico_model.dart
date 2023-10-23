import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'criar_pedido_servico_widget.dart' show CriarPedidoServicoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CriarPedidoServicoModel
    extends FlutterFlowModel<CriarPedidoServicoWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextFieldCadastroTituloServico widget.
  FocusNode? textFieldCadastroTituloServicoFocusNode;
  TextEditingController? textFieldCadastroTituloServicoController;
  String? Function(BuildContext, String?)?
      textFieldCadastroTituloServicoControllerValidator;
  String? _textFieldCadastroTituloServicoControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for TextFieldDescricao widget.
  FocusNode? textFieldDescricaoFocusNode;
  TextEditingController? textFieldDescricaoController;
  String? Function(BuildContext, String?)?
      textFieldDescricaoControllerValidator;
  String? _textFieldDescricaoControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório';
    }

    return null;
  }

  // State field(s) for TextFieldSelectedTipoServico widget.
  FocusNode? textFieldSelectedTipoServicoFocusNode;
  TextEditingController? textFieldSelectedTipoServicoController;
  String? Function(BuildContext, String?)?
      textFieldSelectedTipoServicoControllerValidator;
  String? _textFieldSelectedTipoServicoControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Necessário selecionar um tipo';
    }

    return null;
  }

  // State field(s) for TextFieldImageUpload widget.
  FocusNode? textFieldImageUploadFocusNode;
  TextEditingController? textFieldImageUploadController;
  String? Function(BuildContext, String?)?
      textFieldImageUploadControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  List<TipoPedidoRecord>? dropDownTipoPedidoRecordListPreviousSnapshot;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textFieldCadastroTituloServicoControllerValidator =
        _textFieldCadastroTituloServicoControllerValidator;
    textFieldDescricaoControllerValidator =
        _textFieldDescricaoControllerValidator;
    textFieldSelectedTipoServicoControllerValidator =
        _textFieldSelectedTipoServicoControllerValidator;
  }

  void dispose() {
    textFieldCadastroTituloServicoFocusNode?.dispose();
    textFieldCadastroTituloServicoController?.dispose();

    textFieldDescricaoFocusNode?.dispose();
    textFieldDescricaoController?.dispose();

    textFieldSelectedTipoServicoFocusNode?.dispose();
    textFieldSelectedTipoServicoController?.dispose();

    textFieldImageUploadFocusNode?.dispose();
    textFieldImageUploadController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
