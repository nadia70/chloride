import 'package:flutter/material.dart';

class BatteryActivation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        // appBar: AppBar(
        //   title: Text(appTitle),
        // ),
        body: MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class. This class will hold the data related to
// the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  //
  // Note: This is a GlobalKey<FormState>, not a GlobalKey<MyCustomFormState>!
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 19.0),
              child: Column(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 19.0),
                ),

                Image.asset(
                  'assets/images/logo.png',
                  fit: BoxFit.contain,
                  height: 60,
                ),
                Text('Activate your battery Warranty today'),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Vehicle Type",
                      labelText: "Vehicle Type"
                  ),
                  validator: (value) {
                    if(value.isEmpty) {
                      return 'Please enter a vehicle type';
                    }
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Mileage",
                      labelText: "Mileage"
                  ),
                  validator: (value) {
                    if(value.isEmpty) {
                      return 'Please enter Mileage';
                    }
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "SKU NUMBER",
                      labelText: "SKU NUMBER"
                  ),
                  validator: (value) {
                    if(value.isEmpty) {
                      return 'Please enter valid SKU NUMBER';
                    }
                    else if(!isNumeric(value))
                    {
                      return 'Please enter a valid SKU NUMBER';
                    }
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Email",
                      labelText: "Email"
                  ),


                  validator: (value) {
                    if(value.isEmpty) {
                      return 'Please enter Email';
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0,  vertical: 16.0),
                  child: RaisedButton(
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState.validate()) {
                        // If the form is valid, we want to show a Snackbar
                        Scaffold
                            .of(context)
                            .showSnackBar(
                            SnackBar(content: Text('Processing Data'),
                            )
                        ).closed.then((SnackBarClosedReason reason) {
                          _opennewpage();
                        });
                      }
                    },
                    child: Text('Activate'),
                  ),
                ),
              ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  void _opennewpage() {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
        builder: (BuildContext context) {
          return new Scaffold(
            appBar: new AppBar(
              title: new Text('Success'),
            ),
            body: new Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 19.0),
                    child: Column(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 19.0),
                      ),

                      Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.contain,
                        height: 60,
                      ),
                      Text('You have Successfully activated your 1yr warranty',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: new TextStyle(fontWeight: FontWeight.w300),
                      ),

                    ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

bool isNumeric(String s) {
  try
  {
    return double.parse(s) != null;
  }
  catch (e)
  {
    return false;
  }
}