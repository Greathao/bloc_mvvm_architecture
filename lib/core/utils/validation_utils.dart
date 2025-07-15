class ValidationUtils {
  /// 手机号校验（示例：中国手机号）
  static bool isValidPhone(String phone) {
    final regex = RegExp(r'^1[3-9]\d{9}$');
    return regex.hasMatch(phone);
  }

  /// 密码复杂度校验，至少8位，包含数字和字母
  static bool isValidPassword(String password) {
    final regex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
    return regex.hasMatch(password);
  }
}
