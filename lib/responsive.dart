// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class LayoutBuilderWidget extends StatelessWidget {
  const LayoutBuilderWidget({
    Key? key,
    required this.mobile,
    required this.desktop,
  }) : super(key: key);
  final Widget mobile;
  final Widget desktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      if (constraint.maxWidth < 768) {
        return mobile;
      } else {
        return desktop;
      }
    });
  }
}
