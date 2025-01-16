extension StringUtils on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }

  double toDoubleIdFormat() {
    final newString = replaceAll('.', '');
    return double.tryParse(newString.replaceAll(',', '.')) ?? 0.0;
  }

  int toIntIdFormat() {
    final newString = replaceAll('.', '');
    return int.tryParse(newString.replaceAll(',', '')) ?? 0;
  }

  String toCapitalized() {
    return length > 0
        ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}'
        : '';
  }

  String toTitleCase() {
    return replaceAll(RegExp(' +'), ' ')
        .split(' ')
        .map((str) => str.toCapitalized())
        .join(' ');
  }
}
