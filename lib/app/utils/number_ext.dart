import 'package:intl/intl.dart';

extension NumberExt on double? {
  String toFormatRupiah({int decimal = 0}) {
    return NumberFormat.currency(
            locale: 'id', symbol: 'Rp ', decimalDigits: decimal)
        .format(this);
  }

  String toFormatInputRupiah() {
    return NumberFormat.currency(locale: 'id', symbol: '', decimalDigits: 0)
        .format(this);
  }

  double toFloor() {
    int bagianBulat = (this)?.toInt() ?? 0;
    double bagianDesimal = ((this) ?? 0) - bagianBulat;

    if (bagianDesimal >= 0.50) {
      return bagianBulat + 1;
    } else {
      return bagianBulat.toDouble();
    }
  }
}
