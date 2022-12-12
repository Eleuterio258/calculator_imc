import 'package:calculator_imc/bloc/service_bloc/service_model.dart';
import 'package:equatable/equatable.dart';
 

abstract class ServiceState extends Equatable {}

class ServiceInitialState extends ServiceState {
  @override
  List<Object?> get props => [];
}

class ServiceLoadingState extends ServiceState {
  @override
  List<ServiceModel> get props => [];
}

class ServiceLoadedState extends ServiceState {
  final List<ServiceModel> service;

  ServiceLoadedState({required this.service});

  @override
  List<ServiceModel?> get props => [];
}

class ServiceFailToLoadedState extends ServiceState {
  final String error;

  ServiceFailToLoadedState({required this.error});

  @override
  List<Object?> get props => [];
}
