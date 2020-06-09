import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:codemagic_bloc/bloc/bloc.dart';

class ApplicationView extends StatelessWidget {
  final TextStyle _style = TextStyle(fontSize: 18);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationBloc, ApplicationState>(
      builder: (context, state) {
        if (state is ApplicationEmpty) {
          BlocProvider.of<ApplicationBloc>(context).add(FetchApplication());
        }
        if (state is ApplicationError) {
          return Center(
            child: Text('Failed to load app info'),
          );
        }
        if (state is ApplicationLoaded) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('App ID: ${state.application.id}', style: _style),
                Text('App Name: ${state.application.appName}', style: _style),
                Text('Last Build Id: ${state.application.lastBuildId}',
                    style: _style),
              ],
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
