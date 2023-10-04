import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

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
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text(
          'Networking',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                loadData();
              },
              child: Text('Get Data'))
        ],
      )),
    );
  }
}

Future<Response> getData() async {
  final Dio dio = Dio();
  const url = 'https://about.google/static/data/locations.json';
  final response = await dio.get(url);

  return response;
}

void loadData() {
  getData().then((response) {
    if (response.statusCode == 200) {
      print(response);
    } else {
      print(response.statusCode);
    }
  }).catchError((onError) {
    debugPrint(onError.toString());
  });
}
