import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
        appBar: AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: Colors.deepPurple,
      title: Text(
        '$args',
        style: const TextStyle(color: Colors.white),
      ),
    ));
  }
}
