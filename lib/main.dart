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
    ..add(Car(
        name: 'Dominus',
        location: 'Freesstylers only',
        description: 'Good boi',
        imageUrl: 'lib/assets/images/dominus.png'))
    ..add(Car(
        name: 'Octane',
        location: 'OVERPOWERED',
        description: 'Good boi',
        imageUrl: 'lib/assets/images/octane.png'))
    ..add(Car(
        name: 'Batmobile',
        location: 'I\'m... BATMAN!',
        description: 'Good boi',
        imageUrl: 'lib/assets/images/batmobile.png'))
    ..add(Car(
        name: 'Backfire',
        location: 'No one uses this',
        description: 'Good boi',
        imageUrl: 'lib/assets/images/backfire.png'))
    ..add(Car(
        name: 'Breakout',
        location: 'Breaking speed of sound',
        description: 'Good boi',
        imageUrl: 'lib/assets/images/breakout.png'))
    ..add(Car(
        name: 'Diestro',
        location: 'Alt-Right',
        description: 'Good boi',
        imageUrl: 'lib/assets/images/diestro.png'))
    ..add(Car(
        name: 'Merc',
        location: 'Fragoneta of Malacatones',
        description: 'Good boi',
        imageUrl: 'lib/assets/images/merc.png'))
    ..add(Car(
        name: 'Fennec',
        location: 'Like Octane but cool',
        description: 'Good boi',
        imageUrl: 'lib/assets/images/fennec.png'))
    ..add(Car(
        name: 'Gizmo',
        location: 'Uglier than you',
        description: 'Good boi',
        imageUrl: 'lib/assets/images/gizmo.png'))
    ..add(Car(
        name: 'Ripper',
        location: 'Mad Max vibes tho...',
        description: 'Good boi',
        imageUrl: 'lib/assets/images/ripper.png'))
    ..add(Car(
        name: 'Roadhog',
        location: 'Other cars are Propaganda',
        description: 'Good boi',
        imageUrl: 'lib/assets/images/roadhog.png'))
    ..add(Car(
        name: 'Scarab',
        location: 'It\'s neither a ball or a car',
        description: 'Good boi',
        imageUrl: 'lib/assets/images/scarab.png'))
    ..add(Car(
        name: 'Delorean',
        location: 'Back to the future',
        description: 'Good boi',
        imageUrl: 'lib/assets/images/delorean.png'));

  Future _showNewCarForm() async {
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
        backgroundColor: Colors.black54,
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.add),
            onPressed: _showNewCarForm,
          ),
        ],
      ),
      body: new Container(
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [.1, .5, .7, .9],
            colors: [
              Colors.green[800],
              Colors.yellow[700],
              Colors.pink[600],
              Colors.purple[400]
            ],
          )),
          child: new Center(
            child: new CarList(initialCars),
          )),
    );
  }
}
