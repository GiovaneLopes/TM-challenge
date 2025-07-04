import 'package:flutter/services.dart';

class InputFormatters {
  static List<TextInputFormatter> get cpf => [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(11),
        TextInputFormatter.withFunction((oldValue, newValue) {
          String digits = newValue.text.replaceAll(RegExp(r'\D'), '');
          String formatted = '';
          for (int i = 0; i < digits.length && i < 11; i++) {
            if (i == 3 || i == 6) formatted += '.';
            if (i == 9) formatted += '-';
            formatted += digits[i];
          }
          return TextEditingValue(
            text: formatted,
            selection: TextSelection.collapsed(offset: formatted.length),
          );
        }),
      ];
}
