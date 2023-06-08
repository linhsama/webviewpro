import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State createState() => _MyAppState();
}

class _MyAppState extends State {
  late InAppWebViewController webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            bottomSheet: Row(children: [
              TextButton(
                  child: const Text("Go to"),
                  onPressed: () {
                    webViewController.loadUrl(
                        urlRequest: URLRequest(
                            url: Uri.parse("http://mnkimdong.ddns.net/webview/")));
                  }),
              ]),
            body: InAppWebView(
              onWebViewCreated: (InAppWebViewController controller) {
                webViewController = controller;
              },
            )));
  }
}