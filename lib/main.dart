import 'package:flutter/material.dart';
import 'package:todo/screens/home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized ();

  await Hive.initFlutter ();
  await Hive.openBox<String>('todo_box'); 
  await Hive.openBox<String>('completed_box');
  
  runApp(ProviderScope(child: const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}