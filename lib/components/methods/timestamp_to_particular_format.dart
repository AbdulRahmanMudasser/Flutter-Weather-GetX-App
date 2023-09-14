import 'package:intl/intl.dart';

// DateFormat.jm() -> 5:08 PM
String timeStampToParticularFormat(int timeStamp) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
  String time = DateFormat('h:mm a').format(dateTime);
  return time;
}
