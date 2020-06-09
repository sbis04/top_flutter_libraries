import 'package:equatable/equatable.dart';

abstract class ApplicationEvent extends Equatable {
  const ApplicationEvent();
}

class FetchApplication extends ApplicationEvent {
  const FetchApplication();

  @override
  List<Object> get props => [];
}
