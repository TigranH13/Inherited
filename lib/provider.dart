import 'package:flutter/material.dart';

class ChangeNotifierProvider<T extends ChangeNotifier>
    extends InheritedNotifier<T> {
  final T model;

  const ChangeNotifierProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(
          child: child,
          notifier: model,
          key: key,
        );

  static T watch<T extends ChangeNotifier>(BuildContext context) {
    final ChangeNotifierProvider<T>? provider =
        context.dependOnInheritedWidgetOfExactType<ChangeNotifierProvider<T>>();
    if (provider != null) {
      return provider.notifier as T;
    } else {
      throw Exception();
    }
  }

  static T read<T extends ChangeNotifier>(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<ChangeNotifierProvider<T>>()
        ?.widget;

    if (widget is ChangeNotifierProvider<T>) {
      return widget.notifier as T;
    } else {
      throw Exception();
    }
  }
}

extension WatchAndReadContext on BuildContext {
  T watch<T extends ChangeNotifier>() {
    return ChangeNotifierProvider.watch<T>(this);
  }

  T read<T extends ChangeNotifier>() {
    return ChangeNotifierProvider.read<T>(this);
  }
}
