import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:ui';

class FirstTab extends StatelessWidget {

  TextEditingController vendor_code=new TextEditingController();
  TextEditingController pass=new TextEditingController();

  String msg='';

  Future<List> _verify() async {
    final response = await http.post("http://chksmart.co.ke/pin.php", body: {
      "vendor_code": vendor_code.text,

    });

    var datauser = json.decode(response.body);

    if(datauser.length==0){
      print(() {
        msg="Login Fail";
      });
    }else{
      if(datauser[0]['id']=='$vendor_code'){
        print(() {
          msg="success";
        });
      }


    }

    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(


        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Image.asset('assets/images/2.jpg', fit: BoxFit.cover),
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
              child: Container(
                  color: Colors.black.withOpacity(0.5),
                  padding: EdgeInsets.only(bottom: 0, top: 90.0, left: 20.0, right: 20.0),
                  child: Center(


                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        const SizedBox(
                          height: 30.0,



                        ),

                        Text(
                          'Verify your product',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle( fontSize: 30.0, color: Colors.white),
                        ),


                        const SizedBox(
                          height: 30.0,



                        ),
                        TextFormField(
                          textCapitalization: TextCapitalization.words,
                          controller: vendor_code,
                          decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(30.0),

                              ),


                            ),

                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.only(
                                left: 20.0, bottom: 25.0, top: 25.0, right: 14.0),

                            filled: true,
                            hintText: '123-456-789-10',
                            labelText: 'Product number',
                          ),
                          onSaved: (String value) { var person;
                          person.name = value; },

                        ),

                        const SizedBox(height: 24.0),
                        Center(
                          child: RaisedButton(
                              child: const Text('VERIFY'),
                              onPressed: (){
                                _verify();
                              },
                              color: Colors.red[900], //specify background color for the button here
                              textColor: Colors.white,
                              colorBrightness: Brightness
                                  .dark, //specify the color brightness here, either `Brightness.dark` for darl and `Brightness.light` for light
                              disabledColor:
                              Colors.blueGrey, // specify color when the button is disabled
                              highlightColor: Colors
                                  .red, //color when the button is being actively pressed, quickly fills the button and fades out after
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50.0, vertical: 20.0),
                              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
                          ),
                        ),
                      ],
                    ),

                  )// TODO: child: _buildContent(),
              ),
            ),
          ],
        ),





    );
  }
}