import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            Column(
              children: [
                TextFormField(
                  controller: fullNameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Full Name*'),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Phone Number*')),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Full Name*')),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Full Name*')),
                ElevatedButton(
                  onPressed: () {
                    toNextPage(context, fullNameController);
                  },
                  child: const Text('CUM'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

void toNextPage(
    BuildContext context, TextEditingController fullNameController) {
  final text = fullNameController.text;
  Navigator.of(context).pushNamed('/info', arguments: text);
}
