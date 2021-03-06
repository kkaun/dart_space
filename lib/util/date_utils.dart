library utils;

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

const String BASE_DATE_FORMAT = 'yyyy-MM-dd';

final DateFormat baseFormatter = new DateFormat(BASE_DATE_FORMAT);

String getFormattedStrFromDateTime(DateTime dateTime) => baseFormatter.format(dateTime);

String getTodayDateFormattedStr() => baseFormatter.format(DateTime.now());

DateTime getPreviousDateFrom(DateTime currentDateTime) => currentDateTime.subtract(new Duration(days: 1));

DateTime getNextDateFrom(DateTime currentDateTime) => currentDateTime.add(new Duration(days: 1));

bool dateIsValid(DateTime date) => date.isAfter(DateTime(1995, 6, 17)) 
          && date.isBefore(DateTime.now().add(new Duration(days: 1)));