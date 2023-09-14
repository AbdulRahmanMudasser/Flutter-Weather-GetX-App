import 'package:intl/intl.dart';

// DateFormat.jm() -> 5:08 PM
String timeStampToParticularFormat(timeStamp) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);

  String particularFormat = DateFormat('h:mm a').format(dateTime);

  return particularFormat;
}

// String convertTimestampWith3HourDifference(int timestamp) {
//   // Convert the timestamp to milliseconds if it's in seconds
//   int timestampInMilliseconds = timestamp * 1000;
//
//   // Add a 3-hour difference (3 * 60 * 60 * 1000 milliseconds) to the timestamp
//   int adjustedTimestampInMilliseconds = timestampInMilliseconds + (3 * 60 * 60 * 1000);
//
//   // Create a DateTime object from the adjusted timestamp
//   DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(adjustedTimestampInMilliseconds);
//
//   // Format the DateTime object in your desired time format
//   String formattedTime = DateFormat('h:mm a').format(dateTime);
//
//   return formattedTime;
// }
