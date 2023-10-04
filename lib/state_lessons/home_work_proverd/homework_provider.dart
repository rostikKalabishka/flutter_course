import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/model.dart';

class HomeWorkProvider extends StatelessWidget {
  const HomeWorkProvider({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<HomeWorkProviderModel>();
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text(
            'Homework Provider',
            style: TextStyle(color: Colors.white),
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              width: 100,
              height: 100,
              color: Colors.amber,
              duration: const Duration(seconds: 3),
            ),
            Switch(
              value: model.light,
              onChanged: (bool value) {
                model.light = value;
              },
              activeColor: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
