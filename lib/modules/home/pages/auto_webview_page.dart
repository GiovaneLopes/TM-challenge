import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:tm_challenge/modules/shared/resources/colors.dart';
import 'package:tm_challenge/modules/home/widgets/custom_app_bar.dart';

class AutoWebViewPage extends StatefulWidget {
  const AutoWebViewPage({super.key});

  @override
  State<AutoWebViewPage> createState() => _AutoWebViewPageState();
}

class _AutoWebViewPageState extends State<AutoWebViewPage> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.black)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView está carregando (progresso: $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Página começou a carregar: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Página terminou de carregar: $url');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
              Erro de recurso da web:
              Código: ${error.errorCode}
              Descrição: ${error.description}
              URL: ${error.url}
            ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com')) {
              debugPrint('Bloqueando navegação para YouTube');
              return NavigationDecision.prevent; // Bloqueia a navegação
            }
            debugPrint('Permitindo navegação para: ${request.url}');
            return NavigationDecision.navigate; // Permite a navegação
          },
        ),
      )
      ..loadRequest(
        Uri.parse(
          'https://www.tokiomarine.com.br/',
        ),
      ); // Carrega a URL inicial
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: Modular.to.pop,
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.textPrimary,
          ),
        ),
      ),
      body: WebViewWidget(controller: controller), // Exibe a WebView
    );
  }
}
