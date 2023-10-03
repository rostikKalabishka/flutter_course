import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'model/used.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final fullNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final countryController = TextEditingController();
  final lifeStoryController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final fullNameFocus = FocusNode();
  final phoneNumberFocus = FocusNode();
  final emailFocus = FocusNode();

  final passwordFocus = FocusNode();

  @override
  void dispose() {
    fullNameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    lifeStoryController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    fullNameFocus.dispose();
    phoneNumberFocus.dispose();
    emailFocus.dispose();

    passwordFocus.dispose();

    super.dispose();
  }

  void nextFocus(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  final _formKey = GlobalKey<FormState>();

  bool isObscurePassword = true;
  bool isObscureConfirmPassword = true;

  List<String> country = ['Ukraine', 'Moldova', 'UK', 'USA'];
  String? _selectedCountry;
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
                    focusNode: fullNameFocus,
                    autofocus: true,
                    onFieldSubmitted: (_) =>
                        nextFocus(context, fullNameFocus, phoneNumberFocus),
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
                      focusNode: phoneNumberFocus,
                      autofocus: true,
                      onFieldSubmitted: (_) =>
                          nextFocus(context, fullNameFocus, emailFocus),
                      validator: (value) => validatePhone(value!),
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
                      autofocus: true,
                      focusNode: emailFocus,
                      onFieldSubmitted: (_) =>
                          nextFocus(context, emailFocus, passwordFocus),
                      controller: emailController,
                      validator: (value) => validateEmail(value!),
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email Address',
                          prefixIcon: Icon(Icons.mail))),
                  const SizedBox(
                    height: 15,
                  ),
                  DropdownButtonFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    items: country.map((country) {
                      return DropdownMenuItem(
                        value: country,
                        child: Text(country),
                      );
                    }).toList(),
                    onChanged: (data) {
                      setState(() {
                        _selectedCountry = data ?? '';
                      });
                    },
                    value: _selectedCountry,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                      controller: lifeStoryController,
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
                      autofocus: true,
                      focusNode: passwordFocus,
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
                      toNextPage(context);
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

  void _showDialog(User user) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('${user.name} is now a verified register form'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/info', arguments: user);
                    // Navigator.of(context).pop();
                  },
                  child: const Text('Verified'))
            ],
            title: const Text('Registration successful'),
          );
        });
  }

  showMessage({required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.deepPurple,
      content: Center(
        child: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    ));
  }

  void toNextPage(
    BuildContext context,
  ) {
    User user = User(
        story: lifeStoryController.text.trim(),
        name: fullNameController.text,
        phoneNumber: phoneNumberController.text,
        email: emailController.text,
        country: _selectedCountry ?? ''.trim());
    if (_formKey.currentState!.validate()) {
      _showDialog(user);
    } else {
      showMessage(message: 'Form invalid');
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
    // if (!emailController.text.contains('@')) {
    //   return 'it`s not email';
    // }
    // if (value.isEmpty) {
    //   return 'email required';
    // } else if (!emailController.text.contains('@')) {
    //   return 'it`s not email';
    // } else {
    //   return null;
    // }
  }

  String? validatePhone(String value) {
    if (value.isEmpty) {
      return 'phone number is required';
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
