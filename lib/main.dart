import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quictionary/blocs/word_bloc.dart';
import 'package:quictionary/locator.dart';
import 'package:quictionary/pages/tabbarpage.dart';

Future<void> main() async {
  setupLocator();
  await Hive.initFlutter('words');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WordBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Quictionary',
        home: MyHomePage(),
      ),
    );
  }
}
