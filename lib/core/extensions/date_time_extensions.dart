extension DateTimeX on DateTime? {
  bool checkDeadline(Duration duration) {
    if (this == null) return false;
    final deadline = this?.add(duration);
    return deadline?.isAfter(DateTime.now()) ?? false;
  }
}
