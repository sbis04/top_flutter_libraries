import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_demo/models/color.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:path_provider/path_provider.dart';

import 'hive_view.dart';

final Widget text = Padding(
  padding: EdgeInsets.all(8.0),
  child: Text(
    'Generate',
    style: TextStyle(
      color: Colors.white,
      fontSize: 24,
    ),
  ),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  Hive.registerAdapter(CustomColorAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hive',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hive'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                child: HiveView(),
              ),
              'Codemagic'
                  .text
                  .uppercase
                  .red600
                  .bold
                  .letterSpacing(8)
                  .size(40)
                  .make()
                  .p16(),
            ],
          ),
        ),
      ),
    );
  }
}
