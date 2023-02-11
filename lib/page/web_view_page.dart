import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String url;
  final String? title;

  const WebViewPage(this.url, {this.title});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final loading = true.obs;
  late final WebViewController webViewController;

  @override
  void initState() {
    super.initState();
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(onPageFinished: (_) {
        loading.value = false;
      }))
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget? getTitleWidget() {
      if (widget.title == null) {
        return null;
      }
      return AppBar(
        title: Text(widget.title!!),
      );
    }
    return Scaffold(
      appBar: getTitleWidget(),
      body: Stack(
        children: [
          WebViewWidget(controller: webViewController),
          Obx(() {
            return Visibility(
              visible: loading.isTrue,
              child: const LinearProgressIndicator(),
            );
          }),
        ],
      ),
    );
  }
}
