class Helper {
  static String convertMinutes(int minutes) {
    var mod = minutes % 60;
    var divider = (minutes / 60).floor();

    if (divider == 0) {
      return '${mod}m';
    }

    if (mod == 0) {
      return '$divider';
    }

    return '${divider}h ${mod}m';
  }

  static String getYear(String date) {
    return date.split('-')[0];
  }
}
