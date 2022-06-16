import 'package:api_project/data/api/providers/api_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/home_view.dart';

void main() {
  runApp(ChangeNotifierProvider<ApiProvider>(
      create: ((context) => ApiProvider()), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeView(),
    );
  }
}
