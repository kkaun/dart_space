library utils;

import 'package:intl/intl.dart';

const String BASE_DATE_FORMAT = 'yyyy-MM-dd';

DateFormat baseFormatter = new DateFormat(BASE_DATE_FORMAT);

String getFormattedStrFromDateTime(DateTime dateTime) => baseFormatter.format(dateTime);

String getTodayDateFormattedStr() => baseFormatter.format(DateTime.now());

String getPreviousFormattedDateStr(DateTime currentDateTime) {
    DateTime prevDate = currentDateTime.subtract(new Duration(days: 1));
    return baseFormatter.format(prevDate);
}

String getNextFormattedDateStr(DateTime currentDateTime) {
    DateTime nextDate = currentDateTime.add(new Duration(days: 1));
    return baseFormatter.format(nextDate);
}