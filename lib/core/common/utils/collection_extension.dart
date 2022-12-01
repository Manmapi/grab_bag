import 'dart:math';

extension CollectionExtension on List {
  dynamic random() {
    return this[Random().nextInt(length)];
  }
}
