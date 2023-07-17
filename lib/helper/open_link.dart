import 'package:flutter/cupertino.dart';
import 'package:teste_ava/helper/flutter_toast.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openUrl({
  required BuildContext context,
  required String url,
}) async {
  final Uri urlConvert = Uri.parse(url);
  try {
    if (!await launchUrl(
      urlConvert,
      mode: LaunchMode.externalApplication,
      webViewConfiguration: const WebViewConfiguration(
        enableJavaScript: false,
      ),
    )) {
      flutterToast(title: 'Não foi possivel acessar a localização');
    }
  } catch (erro) {
    return;
  }
}
