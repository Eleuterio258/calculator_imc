import 'package:calculator_imc/bloc/imc/imc_bloc.dart';
import 'package:calculator_imc/bloc/imc/imc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/imc/imc_event.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final peso = TextEditingController();
  final altura = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.read<ImcBloc>().add(const OnPressButtonClean());
              },
              icon: const Icon(Icons.clean_hands))
        ],
        title: const Text('IMC CALCULATOR BLOC'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: peso,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Peso',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por Favor insira o Peso';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: altura,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Altura',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por Favor insira o texto Altura';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<ImcBloc>().add(OnPessButtonCalculate(
                        double.parse(peso.text), double.parse(altura.text)));
                  }
                },
                child: const Text('Calcular'),
              ),
            ),
            BlocBuilder<ImcBloc, ImcState>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("PESO: ${state.imc}"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("ESTADO: ${state.message}"),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
