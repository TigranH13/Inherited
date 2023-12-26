import 'package:flutter/material.dart';

class DataProviderInherited extends InheritedModel<String> {
  final int value;
  final int value2;

  const DataProviderInherited(
      {Key? key,
      required this.value,
      required Widget child,
      required this.value2})
      : super(
          child: child,
          key: key,
        );

  @override
  bool updateShouldNotify(covariant DataProviderInherited oldWidget) {
    return value != oldWidget.value;
  }

  @override
  bool updateShouldNotifyDependent(
      covariant DataProviderInherited oldWidget, Set<String> dependencies) {
    final isValueUpdated =
        value != oldWidget.value && dependencies.contains('one');
    final isValue2TwoUpdated =
        value2 != oldWidget.value2 && dependencies.contains('two');
    return isValueUpdated || isValue2TwoUpdated;
  }
}
