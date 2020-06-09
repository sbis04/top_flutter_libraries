import 'package:flutter/material.dart';

import 'package:mockito_demo/models/application.dart';
import 'package:http/http.dart' as http;

class ApplicationView extends StatefulWidget {
  @override
  _ApplicationViewState createState() => _ApplicationViewState();
}

class _ApplicationViewState extends State<ApplicationView> {
  var _client = http.Client();

  TextStyle _style = TextStyle(fontSize: 20);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: FutureBuilder(
            future: fetchApps(_client),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Application application = snapshot.data;
                return Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Text(application.appName, style: _style),
                      Text(application.id, style: _style),
                      Text(application.lastBuildId, style: _style)
                    ],
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
