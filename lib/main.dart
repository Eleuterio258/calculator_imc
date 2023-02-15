import 'package:calculator_imc/bloc/equacao/equacao_bloc.dart';
import 'package:calculator_imc/bloc/freela/freela_page.dart';
import 'package:calculator_imc/bloc/imc/imc_bloc.dart';
import 'package:calculator_imc/bloc/service_bloc/service_bloc.dart';
import 'package:calculator_imc/bloc/service_bloc/service_event.dart';
import 'package:calculator_imc/bloc/service_bloc/service_respositoty.dart';
import 'package:calculator_imc/page/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}







class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ImcBloc(),
        ),
        BlocProvider(
          create: (context) => EquacaoBloc(),
        ),
        BlocProvider<ServiceBloc>(
          create: (context) =>
              ServiceBloc(serviceRespositoty: ServiceRespositoty())
                ..add(ServiceLoadEvent()),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
