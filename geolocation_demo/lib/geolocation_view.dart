import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationView extends StatefulWidget {
  @override
  _GeolocationViewState createState() => _GeolocationViewState();
}

class _GeolocationViewState extends State<GeolocationView> {
  TextStyle _style = TextStyle(fontSize: 20);
  Position? _currentPosition;

  // Method for retrieving the current location
  _getCurrentLocation() {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
      // _getAddress();
    }).catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _currentPosition != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Latitude:  ${_currentPosition?.latitude}',
                    style: _style,
                  ),
                  Text(
                    'Longitude:  ${_currentPosition?.longitude}',
                    style: _style,
                  )
                ],
              )
            : Container(),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: ElevatedButton(
            onPressed: _getCurrentLocation,
            child: Text('GET LOCATION', style: _style),
          ),
        )
      ],
    );
  }
}
