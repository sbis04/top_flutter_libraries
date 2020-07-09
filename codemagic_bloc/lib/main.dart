import 'package:codemagic_bloc/repositories/codemagic_api_client.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:codemagic_bloc/repositories/repositories.dart';

import 'application_page.dart';

class ApplicationBlocDelegate extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() {
  CodemagicApiClient client = CodemagicApiClient();

  ApplicationRepository repository =
      ApplicationRepository(codemagicApiClient: client);

  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final ApplicationRepository repository;

  MyApp({@required this.repository}) : assert(repository != null);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BLoC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(headline6: TextStyle(fontSize: 40)),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(repository: repository),
    );
  }
}

class HomePage extends StatelessWidget {
  final ApplicationRepository repository;

  HomePage({@required this.repository}) : assert(repository != null);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Application Info'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                child: ApplicationPage(repository: repository),
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
