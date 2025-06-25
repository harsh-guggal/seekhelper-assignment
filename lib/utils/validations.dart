class CustomValidations {
  static String? nullValidator(String? value, {String? customMessage}) {
    if (value == null || value.trim().isEmpty) {
      return customMessage ?? 'Please enter a value';
    }
    return null;
  }

  static String? noSpecialCharacterValidator(String? value, {String? customMessage}) {
    final digitRegex = RegExp(r'\d');
    final specialCharRegex = RegExp(r'[!@#\$%^&*()_+\-=\[\]{};:"\\|,.<>\/?`~]');

    if (value == null || value.trim().isEmpty) {
      return customMessage ?? 'Please enter a value';
    } else if (digitRegex.hasMatch(value)) {
      return 'Digits are not allowed';
    } else if (specialCharRegex.hasMatch(value)) {
      return 'Special characters are not allowed';
    }
    return null;
  }

  static String? emailValidator(String? value, {String? customMessage}) {
    final nullValidationResult = nullValidator(value, customMessage: customMessage);
    if (nullValidationResult != null) {
      return customMessage ?? 'Please enter an email address';
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value!)) {
      return customMessage ?? 'Please enter a valid email address';
    }
    return null;
  }

  static String? phoneValidator(String? value, {String? customMessage}) {
    final nullValidationResult = nullValidator(value, customMessage: customMessage);
    if (nullValidationResult != null) {
      return customMessage ?? 'Please enter a phone number';
    }

    final phoneRegex = RegExp(r'^\d{10}$');
    if (!phoneRegex.hasMatch(value!)) {
      return customMessage ?? 'Please enter a valid 10-digit phone number';
    }
    return null;
  }
}
