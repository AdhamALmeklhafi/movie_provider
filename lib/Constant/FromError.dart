import 'package:flutter/material.dart';

Widget FormError({List? errors}) {
  return Column(
    children: List.generate(
      errors!.length,
      (index) => Text(
        errors[index],
        style: const TextStyle(color: Colors.red),
      ),
    ),
  );
}
