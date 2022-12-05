import 'dart:async';

import 'package:calculator_imc/bloc/imc/imc_event.dart';
import 'package:calculator_imc/bloc/imc/imc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImcBloc extends Bloc<ImcEvent, ImcState> {
  ImcBloc() : super(const ImcInitial(0, 'Informe o peso e altura')) {
    on<OnPessButtonCalculate>(_onCalculateImc);

    on<OnPressButtonClean>(_onPressButtonClean);
  }

  FutureOr<void> _onPressButtonClean(
      OnPressButtonClean event, Emitter<ImcState> emit) {
    emit(const ImcInitial(0, 'Informe o peso e altura'));
  }

  FutureOr<void> _onCalculateImc(
      OnPessButtonCalculate event, Emitter<ImcState> emit) {
    emit(const ImcLoading(0, 'Calculando'));

    try {
      final imc = event.weight / (event.height * event.height);

      if (imc < 18.5) {
        emit(ImcSuccess(imc, 'Abaixo do peso'));
      } else if (imc >= 18.5 && imc <= 24.9) {
        emit(ImcSuccess(imc, 'Peso normal'));
      } else if (imc >= 25 && imc <= 29.9) {
        emit(ImcSuccess(imc, 'Sobrepeso'));
      } else if (imc >= 30) {
        emit(ImcSuccess(imc, 'Obesidade'));
      } else if (event.height == 0 || event.weight == 0) {
        emit(const ImcError(0, 'Informe o peso e altura', ''));
      }
    } catch (e) {
      emit(ImcError(0.0, 'Erro ao calcular o IMC', e.toString()));
    }
  }
}
