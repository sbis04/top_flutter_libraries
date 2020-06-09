import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationView extends StatefulWidget {
  @override
  _GeolocationViewState createState() => _GeolocationViewState();
}

class _GeolocationViewState extends State<GeolocationView> {
  TextStyle _style = TextStyle(fontSize: 20);
  final Geolocator _geolocator = Geolocator();
  Position _currentPosition;
  String _currentAddress;

  // Method for retrieving the current location
  _getCurrentLocation() {
    _geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
      _getAddress();
    }).catchError((e) {
      print(e);
    });
  }

  // Method for retrieving the address
  _getAddress() async {
    try {
      List<Placemark> p = await _geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
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
                    'Latitude:  ${_currentPosition.latitude}',
                    style: _style,
                  ),
                  Text(
                    'Longitude:  ${_currentPosition.longitude}',
                    style: _style,
                  ),
                  _currentAddress != null
                      ? Text(
                          'Address:  $_currentAddress',
                          style: _style,
                        )
                      : Container(),
                ],
              )
            : Container(),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: RaisedButton(
            onPressed: _getCurrentLocation,
            child: Text('GET LOCATION', style: _style),
          ),
        )
      ],
    );
  }
}