import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final fullNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final lifeStoryController = TextEditingController();
  final passwordInputElement = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    lifeStoryController.dispose();
    passwordInputElement.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var isObscure = true;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Register form',
          style: TextStyle(color: Colors.white),
        ),
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
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Full Name*',
                      prefixIcon: const Icon(Icons.person),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        ),
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                    controller: phoneNumberController,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Phone Number*',
                        prefixIcon: const Icon(Icons.call),
                        suffixIcon: IconButton(
                            onPressed: () {
                              phoneNumberController.clear();
                            },
                            icon: const Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            )))),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email Address',
                        prefixIcon: Icon(Icons.mail))),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                    maxLines: 5,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Life Story',
                    )),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                    obscureText: isObscure,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Password*',
                        prefixIcon: const Icon(Icons.security),
                        suffixIcon: IconButton(
                            onPressed: () {
                              obscuredText(isObscure);
                            },
                            icon: isObscure == true
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off)))),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                    obscureText: isObscure,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Confirm Password*',
                        prefixIcon: const Icon(Icons.security),
                        suffixIcon: IconButton(
                            onPressed: () {
                              obscuredText(isObscure);
                            },
                            icon: isObscure == true
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off)))),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 20.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      primary: Colors.deepPurple),
                  onPressed: () {
                    toNextPage(context, fullNameController);
                  },
                  child: const Text(
                    'Submit form',
                    style: TextStyle(color: Colors.white),
                  ),
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

void obscuredText(bool obscuredText) {
  obscuredText = !obscuredText;
}
