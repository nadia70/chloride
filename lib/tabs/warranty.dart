import 'package:flutter/material.dart';
import 'package:chloride_app/tabs/battery_activation.dart';
import 'package:chloride_app/tabs/solar_activation.dart';

class FifthTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Container(
        padding: EdgeInsets.only(top: 48.0, left: 24.0, right: 24.0),
        child: new ListView(
          children: <Widget>[

            new Center(

              child: new Text(
                'PRODUCT ACTIVATION',
                style: new TextStyle(
                  fontSize: 22.00,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            new SizedBox(height: 20.0,),
              new Text(
                'What product do you want to activate?',
                style: new TextStyle(
                  fontSize: 22.00,
                  fontWeight: FontWeight.bold,
                ),
              ),
            new SizedBox(height: 30.0,),
            new RaisedButton(
              color: Colors.indigo,
              child: new Text(
                'Battery',
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> BatteryActivation()));
              },
            ),

            new SizedBox(height: 20.0,),
            new RaisedButton(
              color: Colors.indigo,
              child: new Text(
                'Solar Product',
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> SolarActivation()));
              },
            )
          ],
        ),
      ),
    );
  }
}