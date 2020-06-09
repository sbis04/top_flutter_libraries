import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'secrets.dart';

class BuildView extends StatefulWidget {
  @override
  _BuildViewState createState() => _BuildViewState();
}

class _BuildViewState extends State<BuildView> {
  Dio _dio;
  bool _isBuilding = false;

  TextStyle _buttonTextStyle = TextStyle(fontSize: 20, color: Colors.white);
  TextStyle _textStyle = TextStyle(fontSize: 20, color: Colors.black);

  void _postData() async {
    BaseOptions options = new BaseOptions(
        baseUrl: 'https://api.codemagic.io',
        connectTimeout: 5000,
        receiveTimeout: 3000,
        headers: {
          "Content-Type": "application/json",
          "x-auth-token": API_TOKEN,
        });

    _dio = new Dio(options);

    try {
      Response response = await _dio.post(
        "/builds",
        data: {
          "appId": "5d85eaa0e941e00019e81bc2",
          "workflowId": "5d85f242e941e00019e81bd2",
          "branch": "master",
        },
      );
      if (response.statusCode == 200) {
        setState(() {
          _isBuilding = true;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _isBuilding ? Text('Build started', style: _textStyle) : Container(),
          _isBuilding
              ? Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: CircularProgressIndicator(),
                )
              : Container(),
          RaisedButton(
            onPressed: _postData,
            color: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Text('START BUILD', style: _buttonTextStyle),
          ),
        ],
      ),
    );
  }
}
