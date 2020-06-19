import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:remember_me/utilities/constants.dart';
import 'package:remember_me/widgets/rounded_button.dart';


class HomeOverview extends StatefulWidget {
  static const String id = 'home_overview_screen';
  final int number;

  HomeOverview({this.number}) : super();

  @override
  _HomeOverviewState createState() => _HomeOverviewState();
}

class _HomeOverviewState extends State<HomeOverview> {
  Position myPosition;
  var geolocator = Geolocator();
  var locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);

  void checkPermission() {
    geolocator.checkGeolocationPermissionStatus().then((status) { print('status: $status'); });
    geolocator.checkGeolocationPermissionStatus(locationPermission: GeolocationPermission.locationAlways).then((status) { print('always status: $status'); });
    geolocator.checkGeolocationPermissionStatus(locationPermission: GeolocationPermission.locationWhenInUse)..then((status) { print('whenInUse status: $status'); });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('My number is: ${widget.number}'),
                SizedBox(height: 15,),
                RoundedButton(
                  buttonTitle: 'MY POSITION',
                  onPressed: () async {
                    StreamSubscription<Position> positionStream = geolocator.getPositionStream(locationOptions).listen(
                            (Position position) {
                          myPosition = position;
                          return myPosition;
                        });
                    positionStream.cancel();
                  },
                ),
                Text(
                    'Latitude: ${myPosition != null ? myPosition.latitude.toString() : '0'},'
                        ' Longitude: ${myPosition != null ? myPosition.longitude.toString() : '0'}',
                  style: kMainTitleStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}

