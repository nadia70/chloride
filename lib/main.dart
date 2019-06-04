import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:chloride_app/tabs/first.dart';
import 'package:chloride_app/tabs/order.dart';
import 'package:chloride_app/tabs/search.dart';
import 'package:chloride_app/tabs/service.dart';
import 'package:chloride_app/tabs/warranty.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:chloride_app/tabs/Cart_Screen.dart';


import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';



const kAndroidUserAgent =
    'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36';

String selectedUrl = 'https://docs.google.com/forms/d/e/1FAIpQLSeHu4xhVqpx5n3HQEdB9GpI7BjYACPnhdUHL5GgQ0hS2xONiQ/viewform?vc=0&c=0&w=1';



void main(){
  runApp(new MaterialApp(

      home: new MyHome()));
}

class MyHome extends StatefulWidget {
  @override
  MyHomeState createState() => new MyHomeState();

}

// SingleTickerProviderStateMixin is used for animation
class MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {


  // Create a tab controller
  TabController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = new TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // Appbar
      appBar: new AppBar(
        backgroundColor: Colors.indigo,

        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.contain,
              height: 50,
            ),
            Container(
                padding: const EdgeInsets.all(8.0), child: Text('Chloride Exide'))
          ],

        ),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Cart_screen()));
            },
          ),

          new IconButton(
            icon: new Icon(Icons.message),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FeedBack()),
              );
            },
          )
        ],
      ),


      // Set the TabBar view as the body of the Scaffold
      floatingActionButton: new FloatingActionButton(
        onPressed: ()=> launch("tel:0719080000"),
        child: new Icon(Icons.call),
      ),

      body: new TabBarView(
        // Add tabs as widgets
        children: <Widget>[new FirstTab(), new SecondTab(), new ThirdTab(), new FourthTab(), new FifthTab()],
        // set the controller
        controller: controller,
      ),
      // Set the bottom navigation bar
      bottomNavigationBar: new Material(
        // set the color of the bottom navigation bar
        color: Colors.blueAccent,
        // set the tab bar as the child of bottom navigation bar
        child: new TabBar(
          tabs: <Tab>[
            new Tab(
              // set icon to the tab
              icon: new Icon(Icons.home),
            ),
            new Tab(
              icon: new Icon(Icons.search),
            ),
            new Tab(
              icon: new Icon(Icons.location_on),
            ),

            new Tab(
              icon: new Icon(Icons.dvr),
            ),
            new Tab(
              icon: new Icon(Icons.lock_open),
            ),
          ],
          // setup the controller
          controller: controller,
        ),
      ),
    );
  }
}

class FeedBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: selectedUrl,
      appBar: AppBar(
        title: const Text('Lets talk'),
      ),

      withZoom: true,
      withLocalStorage: true,
      hidden: false,
      withJavascript: true,
      enableAppScheme: true,



    );
  }
}