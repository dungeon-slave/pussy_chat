extension FormattedDateTime on DateTime {
  String extractHoursAndMinutes() {
    return _fillNumericValue(this.hour) + ':' + _fillNumericValue(this.minute);
  }

  String _fillNumericValue(int value) {
    final String stringifyValue = value.toString();

    return value >= 10 ? stringifyValue : '0' + stringifyValue;
  }
}
