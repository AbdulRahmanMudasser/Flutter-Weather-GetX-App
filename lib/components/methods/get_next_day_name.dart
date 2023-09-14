import 'package:intl/intl.dart';

getNextDayName(timeStamp) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
  String nextDayName = DateFormat('EEE').format(dateTime);
  return nextDayName;
}