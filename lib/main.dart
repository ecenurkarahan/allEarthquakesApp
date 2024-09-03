import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/home_controller.dart';
import 'components/home_screen.dart';

void main() {
  runApp(MyView());
}

class MyView extends StatefulWidget {
  const MyView({super.key});

  @override
  State<MyView> createState() {
    return _MyViewState();
  }
}

class _MyViewState extends State<MyView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
          title: const Text(
            'Earthquakes Info',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        body: ChangeNotifierProvider(
          create: (context) => HomeController()..init(),
          child: HomeScreen(),
        ),
      ),
    );
  }
}

