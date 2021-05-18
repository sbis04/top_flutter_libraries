import 'package:flutter/material.dart';

import 'package:codemagic_bloc/bloc/bloc.dart';
import 'package:codemagic_bloc/screens/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'repositories/application_repository.dart';

class ApplicationPage extends StatelessWidget {
  final ApplicationRepository repository;

  ApplicationPage({required this.repository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApplicationBloc(applicationRepository: repository),
      child: ApplicationView(),
    );
  }
}
