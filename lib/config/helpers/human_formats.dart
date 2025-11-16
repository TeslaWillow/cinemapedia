import 'package:intl/intl.dart';

class HumanFormats {

  static String humanNumber(double number) {
    final formatter = NumberFormat.compactCurrency(
      locale: 'en_US',
      decimalDigits: 1,
      symbol: '',
    );
    return formatter.format(number);
  }

}