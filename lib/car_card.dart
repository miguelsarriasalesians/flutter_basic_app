import 'package:basic_flutter_app/car_model.dart';
import 'car_detail_page.dart';
import 'package:flutter/material.dart';

class CarCard extends StatefulWidget {
  final Car car;

  CarCard(this.car);

  @override
  _CarCardState createState() => _CarCardState(car);
}

class _CarCardState extends State<CarCard> {
  Car car;
  String renderUrl;

  _CarCardState(this.car);

  void initState() {
    super.initState();
    renderDogPic();
  }

  Widget get dogImage {
    var dogAvatar = new Hero(
      tag: car,
      child: new Container(
        width: 100.0,
        height: 100.0,
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            image: new DecorationImage(
                fit: BoxFit.cover, image: new NetworkImage(renderUrl ?? ''))),
      ),
    );

    var placeholder = new Container(
      width: 100.0,
      height: 100.0,
      decoration: new BoxDecoration(
          shape: BoxShape.circle,
          gradient: new LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.black54, Colors.black, Colors.blueGrey[600]])),
      alignment: Alignment.center,
      child: new Text(
        'DOGGO',
        textAlign: TextAlign.center,
      ),
    );

    var crossFade = new AnimatedCrossFade(
      firstChild: placeholder,
      secondChild: dogAvatar,
      crossFadeState: renderUrl == null
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: new Duration(milliseconds: 1000),
    );

    return crossFade;
  }

  void renderDogPic() async {
    await car.getImageUrl();
    if (mounted) {
      setState(() {
        renderUrl = car.imageUrl;
      });
    }
  }

  Widget get dogCard {
    return new Positioned(
      right: 0.0,
      child: new Container(
        width: 290,
        height: 115,
        child: new Card(
          color: Colors.black87,
          child: new Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8, left: 64),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new Text(
                  widget.car.name,
                  style: Theme.of(context).textTheme.headline,
                ),
                new Text(
                  widget.car.location,
                  style: Theme.of(context).textTheme.subhead,
                ),
                new Row(
                  children: <Widget>[
                    new Icon(Icons.star),
                    new Text(': ${widget.car.rating}/10')
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  showDogDetailPage() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return new CarDetailPage(car);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return new InkWell(
      onTap: () => showDogDetailPage(),
      child: new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: new Container(
          height: 115.0,
          child: new Stack(
            children: <Widget>[
              dogCard,
              new Positioned(top: 7.5, child: dogImage),
            ],
          ),
        ),
      ),
    );
  }
}
