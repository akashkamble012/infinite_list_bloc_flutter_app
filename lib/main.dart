import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list_bloc_flutter_app/presentation/screens/home_screen.dart';

import 'bloc/simple_bloc_observer.dart';

void main() {
  BlocOverrides.runZoned(() =>
  runApp(const MyApp()), blocObserver: SimpleBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:const HomeScreen(),
    );
  }
}

