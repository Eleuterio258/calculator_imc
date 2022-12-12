import 'package:equatable/equatable.dart';

abstract class EquacaoState extends Equatable {
  final String messageDelta;
  final String messageX;

  final double valDelta;
  final double valX1;
  final double valX2;

  const EquacaoState(
      this.valDelta, this.valX1, this.valX2, this.messageDelta, this.messageX);

  @override
  List<Object> get props => [valDelta, valX1, valX2, messageDelta, messageX];
}

class EquacaoInitial extends EquacaoState {
  const EquacaoInitial(super.valX1, super.valX2, super.valDelta,
      super.messageDelta, super.messageX);
  @override
  List<Object> get props => [valDelta, valX1, valX2, messageDelta, messageX];
}

class EquacaoLoading extends EquacaoState {
  const EquacaoLoading() : super(0.0, 0.0, 0.0, '', '');
  @override
  List<Object> get props => [valDelta, valX1, valX2, messageDelta, messageX];
}

class EquacaoLoaded extends EquacaoState {
  const EquacaoLoaded(super.valX1, super.valX2, super.valDelta,
      super.messageDelta, super.messageX);
  @override
  List<Object> get props => [valDelta, valX1, valX2, messageDelta, messageX];
}

class EquacaoError extends EquacaoState {
  final String error;

  const EquacaoError(super.valDelta, super.valX1, super.valX2,
      super.messageDelta, super.messageX, this.error);
  @override
  List<Object> get props => [valDelta, valX1, valX2, messageDelta, messageX];
}
