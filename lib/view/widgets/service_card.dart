import 'package:flutter/material.dart';

typedef CardBuilder<T> = Widget Function(T item);

class GenericCard<T> extends StatelessWidget {
  final T item;
  final CardBuilder<T> builder;

  const GenericCard({required this.item, required this.builder, super.key});

  @override
  Widget build(BuildContext context) {
    return builder(item);
  }
}
