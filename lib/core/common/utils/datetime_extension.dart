extension StartOfDate on DateTime {
  int getStartOfDay() {
    return DateTime(year, month, day).millisecondsSinceEpoch;
  }

  int getEndOfDay() {
    return DateTime(year, month, day + 1).millisecondsSinceEpoch;
  }
}

extension Display on DateTime {
  String toDisplay() {
    return '$year, ${getMonthString()} $day, ${weekdayName[weekday]}';
  }

  String toHourRange() {
    return '$hour:00 - ${hour + 1}:00';
  }

  String toMinuteRange() {
    return '$hour:$minute - $hour:${minute + 3}';
  }
}

extension DateTimeExtension on DateTime {
  String getMonthString() {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sept';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return 'Err';
    }
  }
}

const Map<int, String> weekdayName = {
  1: 'Monday',
  2: 'Tuesday',
  3: 'Wednesday',
  4: 'Thursday',
  5: 'Friday',
  6: 'Saturday',
  7: 'Sunday'
};
