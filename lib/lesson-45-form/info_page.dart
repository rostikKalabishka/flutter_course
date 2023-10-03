import 'package:flutter/material.dart';
import 'package:flutter_course/lesson-45-form/model/used.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    User? user;
    final args = ModalRoute.of(context)?.settings.arguments;
    user = args as User;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.deepPurple,
        title: Text(
          '${user.name}',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Column(children: [
        ListTile(
          title: Text('${user.name}'),
          subtitle: Text('bbbbb'),
          leading: const Icon(Icons.person),
          trailing: Text('${user.country}'),
        )
      ]),
    );
  }
}
