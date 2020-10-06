import 'package:flutter/material.dart';
import 'dart:async';

import 'car_model.dart';
import 'car_list.dart';
import 'new_car_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rocket League Battlecars',
      theme: ThemeData(brightness: Brightness.dark),
      home: MyHomePage(
        title: 'Rocket League Battlecars',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Car> initialCars = []
    ..add(Car('Ruby', 'Portland, OR, USA',
        'Ruby is a very good girl. Yes: Fetch, loungin\'. No: Dogs who get on furniture.'))
    ..add(Car('Rex', 'Seattle, WA, USA', 'Best in Show 1999'))
    ..add(Car('Rod Stewart', 'Prague, CZ',
        'Star good boy on international snooze team.'))
    ..add(Car('Herbert', 'Dallas, TX, USA', 'A Very Good Boy'))
    ..add(Car('Buddy', 'North Pole, Earth', 'Self proclaimed human lover.'));

  Future _showNewDogForm() async {
    Car newCar = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return AddCarFormPage();
    }));
    if (newCar != null) {
      initialCars.add(newCar);
    }
  }

  @override
  Widget build(BuildContext context) {
    var key = new GlobalKey<ScaffoldState>();
    return new Scaffold(
      key: key,
      appBar: new AppBar(
        title: Center(child: new Text(widget.title)),
        backgroundColor: Color(0xff1F1883),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add),
            onPressed: _showNewDogForm,
          ),
        ],
      ),
      body: new Container(
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [
                .1,
                .5,
                .7,
                .9
              ],
                  colors: [
                Colors.indigo[800],
                Colors.indigo[700],
                Colors.indigo[600],
                Colors.indigo[400]
              ])),
          child: new Center(
            child: new CarList(initialCars),
          )),
    );
  }
}
