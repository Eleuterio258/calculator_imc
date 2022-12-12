import 'dart:async';

import 'package:calculator_imc/bloc/equacao/equacao_event.dart';
import 'package:calculator_imc/bloc/equacao/equacao_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EquacaoBloc extends Bloc<EquacaoEvent, EquacaoState> {
    final formKey = GlobalKey<FormState>();
  final a = TextEditingController();
  final b = TextEditingController();
  final c = TextEditingController();

  EquacaoBloc() : super(const EquacaoInitial(0, 0, 0, '', '')) {
    on<OnPresButtonCalculate>(_onCalculateEquacao);
    on<OnPresButtonClean>(_onPressButtonClean);
  }

  FutureOr<void> _onCalculateEquacao(
      OnPresButtonCalculate event, Emitter<EquacaoState> emit) {
    emit(const EquacaoLoading());

    var delta = (event.valB * event.valB) - (4 * event.valA * event.valC);
    print(delta);

    if (delta < 0) {
      emit(EquacaoError(
          delta, 0, 0, 'Delta negativo', 'Não existe raiz real', ''));
    } else if (delta == 0) {
      var x1 = (-event.valB + delta) / (2 * event.valA);

      print(x1);
      emit(EquacaoLoaded(x1, x1, delta, 'Delta = 0', 'X1 = X2 = $x1'));
    } else {
      var x1 = (-event.valB + delta) / (2 * event.valA);
      var x2 = (-event.valB - delta) / (2 * event.valA);
      print(x1);
      emit(
          EquacaoLoaded(x1, x2, delta, 'Delta = $delta', 'X1 = $x1, X2 = $x2'));
    }
  }

  FutureOr<void> _onPressButtonClean(
      OnPresButtonClean event, Emitter<EquacaoState> emit) {
    a.clear();
    b.clear();
    c.clear();

    emit(const EquacaoInitial(0, 0, 0, "", ""));
  }
}
