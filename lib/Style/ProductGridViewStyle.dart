import 'package:flutter/widgets.dart';

SliverGridDelegateWithFixedCrossAxisCount ProductGridViewStyle() {
  return const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 2,
    mainAxisExtent: 250
  );
}
