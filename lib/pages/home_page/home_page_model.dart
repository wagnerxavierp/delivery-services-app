import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/criar_pedido_servico/criar_pedido_servico_widget.dart';
import '/components/dialog_filter_pedidos/dialog_filter_pedidos_widget.dart';
import '/components/empty_list_pedidos/empty_list_pedidos_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/all_chats_page/all_chats_page_widget.dart';
import '/pages/details_pedido_page/details_pedido_page_widget.dart';
import '/pages/profile_page/profile_page_widget.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
