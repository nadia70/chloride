import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:ui';
import 'package:chloride_app/tabs/ItemList.dart';
import 'package:chloride_app/tabs/Cart_Screen.dart';

class SecondTab extends StatefulWidget {


  @override
  _DropdownmenuScreenState createState() => _DropdownmenuScreenState();
}

class _DropdownmenuScreenState extends State<SecondTab> {
  List<DropdownMenuItem<String>> _dropDownMenuStates;
  List<DropdownMenuItem<String>> _dropDownMenuCity;
  String _currentCity;
  String _currentState;

  List<Choice> _listViewData = const <Choice>[
    const Choice(title: 'Mac Pro', date : '1 June 2018',description: 'Mac Pro is a series of workstation and server computer cases designed, manufactured and sold by Apple Inc. since 2006. The Mac Pro, in most configurations and in terms of speed and performance, is the most powerful computer that Apple offers.',  assetName: 'assets/images/acid.jpg'),
    const Choice( title: 'MacBook Pro', date : '1 June 2019',  description: 'MacBook Pro (sometimes abbreviated as MBP) is a line of Macintosh portable computers introduced in January 2006 by Apple Inc.',  assetName: 'assets/images/imported.png'),
    const Choice(title: 'MacBook Air', date : '1 June 2016',  description: 'MacBook Air is a line of laptop computers developed and manufactured by Apple Inc. It consists of a full-size keyboard, a machined aluminum case, and a thin light structure.',  assetName: 'assets/images/max.png'),
    const Choice(title: 'iMac', date : '1 June 2019', description: 'iMac is a family of all-in-one Macintosh desktop computers designed and built by Apple Inc. It has been the primary part of Apple consumer desktop offerings since its debut in August 1998, and has evolved through seven distinct forms.',  assetName: 'assets/images/power.png'),
    const Choice(title: 'Mac Mini', date : '1 June 2017',description: 'Mac mini (branded with lowercase "mini") is a desktop computer made by Apple Inc. One of four desktop computers in the current Macintosh lineup, along with the iMac, Mac Pro, and iMac Pro, it uses many components usually featured in laptops to achieve its small size.',  assetName: 'assets/images/spark.png'),

  ];


  Widget _buildContent() {


    return Column(
      children: <Widget>[

        const SizedBox(
          height: 20.0,



        ),

        Text(
          'Which battery is right for me?',

          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle( fontSize: 24.0, color: Colors.black),
        ),

        const SizedBox(
          height: 20.0,



        ),

        Text(
          'Select your car type + model to find out today ',

          textAlign: TextAlign.center,

          style: TextStyle( fontSize: 12.0, color: Colors.black),
        ),

        SizedBox(

          child: PhysicalModel(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,

            child: Container(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              height: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey[300],
                  )),
              child: FittedBox(
                fit: BoxFit.contain,
                child: DropdownButton(
                  value: _currentState,
                  items: _dropDownMenuStates,

                  onChanged: changedDropDownState,
                  hint: Text('Select Type'),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 5.0,
          height: 50.0,
        ),

        _dropDownMenuCity.isEmpty
            ? Container()
            : SizedBox(
          child: PhysicalModel(
            borderRadius: BorderRadius.circular(50.0),
            color: Colors.white,
            child: Container(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              height: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  border: Border.all(
                    width: 3.0,
                    color: Colors.grey[300],
                  )),
              child: FittedBox(
                fit: BoxFit.contain,
                child: DropdownButton(
                  value: _currentCity,
                  items: _dropDownMenuCity,
                  onChanged: changedDropDownCity,
                  hint: Text('Select Model'),
                ),
              ),
            ),
          ),
        ),

        Expanded(
          child: ListView(
            padding: EdgeInsets.all(10.0),
            children: _listViewData.reversed.map((Choice) {
              return ChoiceCard(
                item: Choice,

              );
            }).toList(),
          ),
        ),

      ],
    );



  }

  List<DropdownMenuItem<String>> getDropDownMenuState() {
    List<DropdownMenuItem<String>> state1 = List();
    for (String statelist in _state) {
      state1.add(DropdownMenuItem(value: statelist, child: Text(statelist)));
    }
    return state1;
  }

  List<DropdownMenuItem<String>> getDropDownMenuKL() {
    List<DropdownMenuItem<String>> kl1 = List();
    for (String kllist in _kl) {
      kl1.add(DropdownMenuItem(value: kllist, child: Text(kllist)));
    }
    return kl1;
  }

  List<DropdownMenuItem<String>> getDropDownMenuSEL() {
    List<DropdownMenuItem<String>> sel1 = List();
    for (String sellist in _sel) {
      sel1.add(DropdownMenuItem(value: sellist, child: Text(sellist)));
    }
    return sel1;
  }

  void changedDropDownState(String selectedState) {
    setState(() {
      _currentCity = null;
      _dropDownMenuCity.clear();

      _currentState = selectedState;

      if (selectedState.toString() == "BMW") {
        _dropDownMenuCity = getDropDownMenuKL();
      } else if (selectedState.toString() == "Audi") {
        _dropDownMenuCity = getDropDownMenuSEL();
      }
      else if (selectedState.toString() == "Toyota") {
        _dropDownMenuCity = getDropDownMenuSEL();
      }
      else if (selectedState.toString() == "suzuki") {
        _dropDownMenuCity = getDropDownMenuKL();
      }
      else if (selectedState.toString() == "Toyota") {
        _dropDownMenuCity = getDropDownMenuSEL();
      }
      else if (selectedState.toString() == "Peugot") {
        _dropDownMenuCity = getDropDownMenuKL();
      }
      else if (selectedState.toString() == "Nissan") {
        _dropDownMenuCity = getDropDownMenuSEL();
      }
      else if (selectedState.toString() == "Hyundai") {
        _dropDownMenuCity = getDropDownMenuKL();
      }

    });
  }

  void changedDropDownCity(String selectedCity) {
    setState(() {
      _currentCity = selectedCity;

      if (selectedCity.toString() == "BMW 1 Series (5-dr)") {
        _dropDownMenuCity = getDropDownMenuKL();
      } else if (selectedCity.toString() == "Audi R8") {
        _dropDownMenuCity = getDropDownMenuSEL();
      } else if (selectedCity.toString() == "BMW M140i (5-dr)") {
        _dropDownMenuCity = getDropDownMenuSEL();
      } else if (selectedCity.toString() == "Audi A4") {
        _dropDownMenuCity = getDropDownMenuSEL();
      } else if (selectedCity.toString() == "Audi A4") {
        _dropDownMenuCity = getDropDownMenuSEL();
      }

    });
  }

  @override
  void initState() {
    _dropDownMenuStates = getDropDownMenuState();
    _dropDownMenuCity = [];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(),
    );
  }
}

List<String> _state = [
  "Audi",
  "BMW",
  "Toyota",
  "Hyundai",
  "Nissan",
  "Suzuki",
  "Peugot"

];

List<String> _kl = [
  "BMW 1 Series (5-dr)",
  "BMW M140i (5-dr)",
  "BMW 2 Series Coupé",
  "BMW M240i Coupé",

];

List<String> _sel = [
  "Audi R8",
  "Audi A4",
  "Audi A8",
  "Audi A3",
  "Audi A1",
  "Audi A5"

];



class Choice {
  final String title;
  final String date;
  final String description;
  final String  assetName;

  const Choice({this.title, this.date, this.description, this.assetName});
}


class ChoiceCard extends StatelessWidget {
  const ChoiceCard(
      {Key key, this.choice, this.onTap, @required this.item, this.selected: false}
      ) : super(key: key);

  final Choice choice;
  final VoidCallback onTap;
  final Choice item;
  final bool selected;


  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;
    if (selected)
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);
    return Card(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            new Container(
                padding: const EdgeInsets.all(8.0),
                child:
                Image.asset(
                    item.assetName
                )),
            new Container(
              padding: const EdgeInsets.all(10.0),
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(item.title, style: Theme.of(context).textTheme.title),
                  Text(item.date, style: TextStyle(color: Colors.black.withOpacity(0.5))),
                  Text(item.description),
                ],
              ),

            ),
            new Container(
              alignment: Alignment.center,
              child: OutlineButton(
                  borderSide: BorderSide(color: Colors.redAccent),
                  child: const Text('Shop now'),
                  textColor: Colors.redAccent,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Cart_screen()));
                  },
                  shape: new OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  )),
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,


        )

    );
  }
}

