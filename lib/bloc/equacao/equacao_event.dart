import 'package:equatable/equatable.dart';

abstract class EquacaoEvent extends Equatable {
  const EquacaoEvent();

  @override
  List<Object> get props => [];
}

class OnPresButtonCalculate extends EquacaoEvent {
  final double valA;
  final double valB;
  final double valC;

  const OnPresButtonCalculate(this.valA, this.valB, this.valC);
  @override
  List<Object> get props => [valA, valB, valC];
}

class OnPresButtonClean extends EquacaoEvent {}
