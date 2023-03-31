import 'package:brewery/presentation/reusables/appbar/appbar.dart';
import 'package:brewery/utils/widget_util.dart';
import 'package:flutter/material.dart';

import 'package:webview_flutter/webview_flutter.dart';

class BreweryDetailWebview extends StatefulWidget {
  static const String routeName = '/website';
  final String url;
  const BreweryDetailWebview({super.key, required this.url});

  @override
  State<BreweryDetailWebview> createState() => _BreweryDetailWebviewState();
}

class _BreweryDetailWebviewState extends State<BreweryDetailWebview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(
        appBarTitle: 'Brewery Website',
        callBack: () => Navigator.of(context).pop(),
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 32),
        child: Expanded(
          child: WebView(
            onPageStarted: (start) => showLoading(),
            onPageFinished: (url) => hideLoading(),
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ),
      ),
    );
  }
}
