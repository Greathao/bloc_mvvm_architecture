
class DateUtils {
  /// 格式化日期为 yyyy-MM-dd
  static String formatDate(DateTime date) {
    return "${date.year.toString().padLeft(4, '0')}-"
        "${date.month.toString().padLeft(2, '0')}-"
        "${date.day.toString().padLeft(2, '0')}";
  }

  /// 计算两个日期间隔天数
  static int daysBetween(DateTime from, DateTime to) {
    return to.difference(from).inDays;
  }
}
