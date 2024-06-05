import 'package:flutter/material.dart';
import 'package:twaddan_demo/table.dart';

import 'bidirection_scroll.dart';
import 'presentation/dashboard/ui/dashboard.dart';
import 'my_data_tbale.dart';
import 'newTable.dart';
import 'overlayExample.dart';

void main() {
  runApp(const MyApp());


}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  DashBoard(),
    );
  }
}

