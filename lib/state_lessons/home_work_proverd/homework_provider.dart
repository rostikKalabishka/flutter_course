import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/model.dart';

class HomeWorkProvider extends StatefulWidget {
  const HomeWorkProvider({super.key});

  @override
  State<HomeWorkProvider> createState() => _HomeWorkProviderState();
}

class _HomeWorkProviderState extends State<HomeWorkProvider> {
  bool biba = true;
  @override
  Widget build(BuildContext context) {
    final model = context.watch<HomeWorkProviderModel>();
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text(
            'Homework Provider',
            style: TextStyle(color: model.colorAppBar),
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              width: 200,
              height: 200,
              color: model.color,
              duration: const Duration(seconds: 3),
            ),
            Switch(
              value: model.light,
              onChanged: (bool value) {
                model.lightB();
              },
              activeColor: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
