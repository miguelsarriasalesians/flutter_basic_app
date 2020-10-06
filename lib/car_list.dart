import 'package:basic_flutter_app/car_card.dart';
import 'package:flutter/material.dart';

import 'car_model.dart';

class CarList extends StatelessWidget {
  final List<Car> cars;
  CarList(this.cars);

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(context) {
    return new ListView.builder(
      itemCount: cars.length,
      itemBuilder: (context, int) {
        return new CarCard(cars[int]);
      },
    );
  }
}
