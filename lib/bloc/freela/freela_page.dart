import 'package:calculator_imc/bloc/service_bloc/service_bloc.dart';
import 'package:calculator_imc/bloc/service_bloc/service_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FreelaPage extends StatelessWidget {
  const FreelaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Text("Let's find you"),
            const Text(
              "dream home",
              style: TextStyle(color: Color(0xff6e38e0)),
            ),
            Container(
              height: 54,
              decoration: const BoxDecoration(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 0, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Previously Viewed"),
                  const SizedBox(
                    height: 16,
                  ),
                  BlocBuilder<ServiceBloc, ServiceState>(
                    builder: (context, state) {
                      if (state is ServiceLoadingState ||
                          state is ServiceInitialState) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (state is ServiceLoadedState) {
                        return SizedBox(
                          height: 215,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.service.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                width: MediaQuery.of(context).size.width / 1.6,
                                margin: const EdgeInsets.only(right: 16),
                                color: Colors.blue,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 215 / 2,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(state
                                                .service[index]
                                                .imageUrl![0]
                                                .path!),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Stack(
                                        children: const [
                                          Positioned(
                                            right: 8,
                                            top: 8,
                                            child: CircleAvatar(
                                              radius: 16,
                                              foregroundColor: Colors.white,
                                              backgroundColor: Colors.black,
                                              child: Icon(
                                                Icons.favorite_border,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.service[index].name!,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Color(0XFF330240)),
                                        ),
                                        Text(state.service[index].description!,
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10,
                                                color: Color(0XFF330240))),
                                        Row(
                                          children: const [
                                            Icon(Icons.star,
                                                color: Colors.yellow),
                                            Icon(Icons.star,
                                                color: Colors.yellow),
                                            Icon(Icons.star,
                                                color: Colors.yellow),
                                            Icon(Icons.star,
                                                color: Colors.yellow),
                                            Icon(Icons.star,
                                                color: Colors.yellow),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      }
                      if (state is ServiceFailToLoadedState) {
                        return Center(child: Text(state.error));
                      }
                      return const Center(child: Text("Error"));
                    },
                  ),
                ],
              ),
            ),
            const Text("Our recomendations"),
          ],
        ),
      ),
    );
  }
}
