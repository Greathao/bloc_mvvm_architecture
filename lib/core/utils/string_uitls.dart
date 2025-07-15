class StringUtils {
  /// 判断字符串是否为 null 或空
  static bool isEmpty(String? str) => str == null || str.trim().isEmpty;

  /// 简单的邮箱校验（示例）
  static bool isEmail(String email) {
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }
}
