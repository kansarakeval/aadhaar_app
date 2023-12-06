import 'package:aadhaar_app/screen/home/modal/home_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class AppLinkScreen extends StatefulWidget {
  const AppLinkScreen({super.key});

  @override
  State<AppLinkScreen> createState() => _AppLinkScreenState();
}

class _AppLinkScreenState extends State<AppLinkScreen> {

  InAppWebViewController? inAppWebViewController;

  @override
  Widget build(BuildContext context) {
    ServiceModeal modeal =
        ModalRoute.of(context)!.settings.arguments as ServiceModeal;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(modeal.title),
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){
              inAppWebViewController!.goBack();
            }, icon: Icon(Icons.arrow_back),),
            IconButton(onPressed: (){
              inAppWebViewController!.goForward();
            }, icon: Icon(Icons.arrow_forward),),
          ],
        ),
        body: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse(modeal.link),
          ),
          onLoadStart: (controller, url) {
            inAppWebViewController = controller;
          },
          onLoadStop:(controller, url) {
            inAppWebViewController = controller;
          },
          onLoadError: (controller, url, code, message) {
            inAppWebViewController = controller;
          },
          onProgressChanged: (controller, progress) {
            inAppWebViewController = controller;
          },
        ),
      ),
    );
  }
}
