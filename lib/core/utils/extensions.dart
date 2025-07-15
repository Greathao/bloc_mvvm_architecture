
extension StringExtensions on String {
  bool get isNotEmptyOrNull => this.trim().isNotEmpty;
}

extension IntExtensions on int {
  bool get isPositive => this > 0;
}
