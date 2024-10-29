class DateCalculator {
  final List<String> weekdays = [
    'MONDAY',
    'TUESDAY',
    'WEDNESDAY',
    'THURSDAY',
    'FRIDAY',
    'SATURDAY',
    'SUNDAY'
  ];

  getDay() {
    DateTime now = DateTime.now();
    return now.day;
  }

  getWeekDay(int year, int month, int day) {
    DateTime date = DateTime(year, month, day);
    return weekdays[date.weekday - 1];
  }

  getLastDayOfThisMonth() {
    // 현재 날짜 가져오기
    DateTime now = DateTime.now();

    // 다음 달의 첫째 날
    DateTime firstDayOfNextMonth = DateTime(now.year, now.month + 1, 1);

    // 이번 달의 마지막 날은 다음 달의 첫째 날에서 하루를 빼면 됨
    return firstDayOfNextMonth.subtract(const Duration(days: 1));
  }
}
