import 'package:basic_flutter_app/car_model.dart';
import 'package:flutter/material.dart';

class AddCarFormPage extends StatefulWidget {
  @override
  _AddCarFormPageState createState() => new _AddCarFormPageState();
}

class _AddCarFormPageState extends State<AddCarFormPage> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController locationController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();

  void submitPup(BuildContext context) {
    if (nameController.text.isEmpty) {
      Scaffold.of(context).showSnackBar(new SnackBar(
        backgroundColor: Colors.redAccent,
        content: new Text('Cars need names!'),
      ));
    } else {
      var newCar = new Car(nameController.text, locationController.text,
          descriptionController.text);
      Navigator.of(context).pop(newCar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Add a new car'),
        backgroundColor: Colors.black87,
      ),
      body: new Container(
        color: Colors.black54,
        child: new Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
          child: new Column(children: [
            new Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: new TextField(
                controller: nameController,
                onChanged: (v) => nameController.text = v,
                decoration: new InputDecoration(labelText: 'Name the Pup'),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: new TextField(
                controller: locationController,
                onChanged: (v) => locationController.text = v,
                decoration: new InputDecoration(labelText: "Pup's location"),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: new TextField(
                controller: descriptionController,
                onChanged: (v) => descriptionController.text = v,
                decoration: new InputDecoration(labelText: 'All about the pup'),
              ),
            ),
            new Padding(
              padding: const EdgeInsets.all(16.0),
              child: new Builder(
                builder: (context) {
                  return new RaisedButton(
                    onPressed: () => submitPup(context),
                    color: Colors.indigoAccent,
                    child: new Text('Submit Pup'),
                  );
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
