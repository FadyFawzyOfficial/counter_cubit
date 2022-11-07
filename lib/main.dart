import 'package:counter_cubit/other_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/counter_cubit.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Counter Cubit',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<CounterCubit, CounterState>(
          listener: (context, state) {
            if (state.counter == 3) {
              showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  content: Text('counter is ${state.counter}'),
                ),
              );
            } else if (state.counter == -1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const OtherScreen(),
                ),
              );
            }
          },
          builder: (context, state) => Text(
            '${state.counter}',
            style: const TextStyle(fontSize: 100),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: context.read<CounterCubit>().decrement,
            heroTag: 'decrement',
            child: const Icon(Icons.remove_rounded),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            onPressed: context.read<CounterCubit>().increment,
            heroTag: 'increment',
            child: const Icon(Icons.add_rounded),
          ),
        ],
      ),
    );
  }
}
