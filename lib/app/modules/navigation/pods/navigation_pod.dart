import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'navigation_pod.g.dart';

@riverpod
class NavigationPod extends _$NavigationPod {
  @override
  int build() {
    state = 0;
    return state;
  }

  void setSelectedIndex(BuildContext context, int index) {
    state = index;
  }
}
