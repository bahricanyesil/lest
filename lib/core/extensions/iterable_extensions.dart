extension IterableX<T extends Object> on Iterable<T> {
  T? findFirst(bool Function(T element) test) {
    for (final element in this) {
      if (test(element)) return element;
    }
    return null;
  }

  bool exist(bool Function(T element) test) {
    final firstEl = findFirst(test);
    return firstEl != null;
  }
}
