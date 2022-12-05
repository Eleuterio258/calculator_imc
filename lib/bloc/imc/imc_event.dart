 
import 'package:equatable/equatable.dart';

abstract class ImcEvent extends Equatable {
  const ImcEvent();

  @override
  List<Object> get props => [];
}


class OnPessButtonCalculate extends ImcEvent {
  final double weight;
  final double height;

  const OnPessButtonCalculate(this.weight, this.height);

  @override
  List<Object> get props => [weight, height];
}

class OnPressButtonClean extends ImcEvent {
  const OnPressButtonClean();
}

 