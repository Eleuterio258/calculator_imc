import 'package:equatable/equatable.dart';

abstract class ImcState extends Equatable {
  final double imc;
  final String message;

  const ImcState(this.imc, this.message);

  @override
  List<Object> get props => [];
}

class ImcInitial extends ImcState {
  const ImcInitial(super.imc, super.message);
}

class ImcLoading extends ImcState {
  const ImcLoading(super.imc, super.message);
}

class ImcSuccess extends ImcState {
  const ImcSuccess(super.imc, super.message);

  @override
  List<Object> get props => [imc, message];
}

class ImcError extends ImcState {
  final String error;

  const ImcError(super.imc, super.message, this.error);

  @override
  List<Object> get props => [message, error, imc];
}
