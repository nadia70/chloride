import 'package:flutter/material.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';


const kAndroidUserAgent =
    'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36';

String selectedUrl = 'https://fir-demo-1b487.firebaseapp.com/';

class ThirdTab extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: selectedUrl,
      appBar: AppBar(
        title: const Text('our locations'),
      ),

      withZoom: false,
      withLocalStorage: true,
      hidden: false,
      withJavascript: true,
      enableAppScheme: true,
      resizeToAvoidBottomInset:true,



    );
  }


}


