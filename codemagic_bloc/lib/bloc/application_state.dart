import 'package:codemagic_bloc/models/applications.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ApplicationState extends Equatable {
  ApplicationState();

  @override
  List<Object> get props => [];
}

class ApplicationEmpty extends ApplicationState {}

class ApplicationLoading extends ApplicationState {}

class ApplicationLoaded extends ApplicationState {
  final Application application;

  ApplicationLoaded({@required this.application}) : assert(application != null);

  @override
  List<Object> get props => [application];
}

class ApplicationError extends ApplicationState {}
