import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:html/dom_parsing.dart';
import 'package:html/parser.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class UrlManager extends ChangeNotifier {
  String _url = '';
  String get url => _url;
  void updateUrl(String newUrl) {
    _url = newUrl;
    print('new url is : ' + newUrl);
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // WebViewController _webviewController;
    final Completer<WebViewController> webviewController =
        Completer<WebViewController>();
    String HOME = 'https://google.com';
    final urlBarController = TextEditingController(text: '');
    String CurrentUrl = '';

    return ChangeNotifierProvider(
      create: (BuildContext context) {},
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: CupertinoTextField(
                      style: TextStyle(color: CupertinoColors.inactiveGray),
                      placeholder: "URL",
                      enabled: true,
                      controller: urlBarController,
                    ),
                  ),
                  Consumer<UrlManager>(builder: (context, urlmanager, _) {
                    return Expanded(
                      child: WebView(
                        initialUrl: HOME,
                        javascriptMode: JavascriptMode.unrestricted,
                        onWebViewCreated: (WebViewController cont) {
                          print('webview was created.');
                          webviewController.complete(cont);
                          urlBarController.text = cont.currentUrl().toString();
                        },
                        onPageFinished: (String url) {
                          print('url changed : ' + url);
                          urlBarController.text = url;
                          // Scaffold.of(context).showSnackBar(SnackBar(content: Text(url),));
                        },
                      ),
                    );
                  }),
                  new NavigationControls(webviewController.future),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NavigationControls extends StatelessWidget {
  const NavigationControls(this._webViewControllerFuture)
      : assert(_webViewControllerFuture != null);

  final Future<WebViewController> _webViewControllerFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
        future: _webViewControllerFuture,
        builder:
            (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
          final bool webViewReady =
              snapshot.connectionState == ConnectionState.done;
          final WebViewController? controller = snapshot.data;
          return Row(
            children: <Widget>[
              CupertinoButton(
                child: Text('Back'),
                onPressed: () {
                  controller!.goBack();
                },
              ),
              CupertinoButton(
                child: Text('Forward'),
                onPressed: () {
                  controller!.goForward();
                },
              ),
              CupertinoButton(
                child: Text('Refresh'),
                onPressed: () {
                  controller!.reload();
                },
              ),
              Spacer(),
              CupertinoButton(
                child: Text('Scrap'),
                onPressed: () async {
                  var docu = await controller!
                          .runJavascript('document.documentElement.innerHTML')
                      as String;
                  // print(docu);
                  var dom = parse(docu);
                  print(dom.getElementsByTagName('title')[0].innerHtml);
                },
              ),
            ],
          );
        });
  }
}
