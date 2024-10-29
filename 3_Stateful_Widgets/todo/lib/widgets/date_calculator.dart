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
    // 현재 UTC 시간
    DateTime nowUtc = DateTime.now().toUtc();

    // 한국 표준시(KST)로 변환
    DateTime nowKst = nowUtc.add(const Duration(hours: 9));
    return nowKst.day;
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
