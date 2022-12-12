import 'package:calculator_imc/bloc/equacao/equacao_bloc.dart';
import 'package:calculator_imc/bloc/equacao/equacao_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/equacao/equacao_state.dart';

class EquacaoPage extends StatelessWidget {
  EquacaoPage({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: context.read<EquacaoBloc>().a,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por Favor insira o valor de A';
                  }
                  if (double.parse(value) < 0) {
                    return 'O valor de A nao Pode Ser Negativo';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Valor A',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: context.read<EquacaoBloc>().b,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por Favor insira o valor de B';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Valor B',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: context.read<EquacaoBloc>().c,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por Favor insira o valor de C';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  labelText: 'Valor C',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<EquacaoBloc>().add(
                            OnPresButtonCalculate(
                              double.parse(context.read<EquacaoBloc>().a.text),
                              double.parse(context.read<EquacaoBloc>().b.text),
                              double.parse(context.read<EquacaoBloc>().c.text),
                            ),
                          );
                    }
                  },
                  child: const Text("Calcular")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    context.read<EquacaoBloc>().add(OnPresButtonClean());
                  },
                  child: const Text("Limpar")),
            ),
            BlocBuilder<EquacaoBloc, EquacaoState>(builder: (context, state) {
              if (state is EquacaoInitial) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("DELTA    : "),
                    Text("VALOR X1 : "),
                    Text("VALOR X2 : "),
                    Text("MESSAGE  : "),
                    Text("MESSAGE  : "),
                  ],
                );
              } else if (state is EquacaoLoading) {
                return const CircularProgressIndicator();
              } else if (state is EquacaoLoaded) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("DELTA    : ${state.valDelta}"),
                    Text("VALOR X1 : ${state.valX1}"),
                    Text("VALOR X2 : ${state.valX2}"),
                    Text("MESSAGE  : ${state.messageDelta}"),
                    Text("MESSAGE  : ${state.messageX}"),
                  ],
                );
              } else if (state is EquacaoError) {
                return Text(state.messageDelta);
              }
              return const Text("Erro ao Carregar");
            })
          ],
        ),
      ),
    );
  }
}
