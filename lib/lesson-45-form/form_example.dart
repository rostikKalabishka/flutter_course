import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    lifeStoryController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  bool isObscurePassword = true;
  bool isObscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
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
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) => validateName(value!),
                    controller: fullNameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Full Name*',
                        prefixIcon: const Icon(Icons.person),
                        suffixIcon: IconButton(
                          onPressed: () {
                            fullNameController.clear();
                          },
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
                      keyboardType: TextInputType.phone,
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
                      controller: emailController,
                      validator: (value) => validateEmail(value!),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email Address',
                          prefixIcon: Icon(Icons.mail))),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                      inputFormatters: [LengthLimitingTextInputFormatter(100)],
                      maxLines: 5,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Life Story',
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                      controller: passwordController,
                      validator: (value) => passwordValidate(value!),
                      obscureText: isObscurePassword,
                      maxLength: 16,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Password*',
                          prefixIcon: const Icon(Icons.security),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isObscurePassword = !isObscurePassword;
                                });
                              },
                              icon: Icon(isObscurePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off)))),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                      controller: confirmPasswordController,
                      validator: (value) => passwordValidate(value!),
                      obscureText: isObscureConfirmPassword,
                      maxLength: 16,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Confirm Password*',
                          prefixIcon: const Icon(Icons.security),
                          suffixIcon: IconButton(
                              onPressed: () {
                                isObscureConfirmPassword =
                                    !isObscureConfirmPassword;
                                setState(() {});
                              },
                              icon: isObscureConfirmPassword == true
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
              ),
            )
          ],
        ),
      ),
    );
  }

  void toNextPage(
      BuildContext context, TextEditingController fullNameController) {
    if (_formKey.currentState!.validate()) {
      final text = fullNameController.text;
      Navigator.of(context).pushNamed('/info', arguments: text);
    }
  }

  String? validateName(String value) {
    final nameExp = RegExp(r'^[A-Za-z]+$');
    if (value.isEmpty) {
      return 'Name is required';
    } else if (!nameExp.hasMatch(value)) {
      return 'Please enter alphabetical characters';
    } else {
      return null;
    }
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'email required';
    } else if (!emailController.text.contains('@')) {
      return 'it`s not email';
    } else {
      return null;
    }
  }

  String? passwordValidate(String value) {
    value = passwordController.text;
    if (value.length < 8) {
      return 'password ne 8';
    } else if (passwordController.text != confirmPasswordController.text) {
      return 'Password does not match';
    } else {
      return null;
    }
  }
}
