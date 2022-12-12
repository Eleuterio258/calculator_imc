import 'package:calculator_imc/bloc/service_bloc/service_model.dart';
import 'package:equatable/equatable.dart';
 

abstract class ServiceEvent extends Equatable {}

class ServiceLoadEvent extends ServiceEvent {
  @override
  List<ServiceModel> get props => [];
}

class PullToRefeshServiceLoadEvent extends ServiceEvent {
  @override
  List<ServiceModel> get props => [];
}

class ServiceByOwnerLoadEvent extends ServiceEvent {
  final String email;

  ServiceByOwnerLoadEvent(this.email);
  @override
  List<ServiceModel> get props => [];
}
