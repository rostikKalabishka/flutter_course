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
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'User Info',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(children: [
        ListTile(
          title: Text(user.name),
          subtitle: user.story.isEmpty && user.story == null && user.story == ""
              ? null
              : Text(user.story),
          leading: const Icon(Icons.person),
          trailing: user.country != null
              ? Text(user.country)
              : const SizedBox.shrink(),
        ),
        ListTile(
          title: Text(user.phoneNumber),
          leading: const Icon(Icons.call),
        ),
        user.email.isNotEmpty || user.email != null
            ? ListTile(
                title: Text(user.email),
                leading: user.email.isEmpty ? null : const Icon(Icons.mail),
              )
            : const SizedBox.shrink(),
      ]),
    );
  }
}
