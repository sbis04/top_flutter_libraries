import 'package:codemagic_bloc/bloc/application_event.dart';
import 'package:codemagic_bloc/bloc/application_state.dart';
import 'package:codemagic_bloc/models/applications.dart';
import 'package:codemagic_bloc/repositories/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  final ApplicationRepository applicationRepository;

  ApplicationBloc({@required this.applicationRepository})
      : assert(applicationRepository != null),
        super(ApplicationEmpty());

  @override
  Stream<ApplicationState> mapEventToState(ApplicationEvent event) async* {
    if (event is FetchApplication) {
      yield ApplicationLoading();

      try {
        final Application application =
            await applicationRepository.fetchApplication();
        yield ApplicationLoaded(application: application);
      } catch (_) {
        ApplicationError();
      }
    }
  }
}
