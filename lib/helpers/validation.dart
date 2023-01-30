import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ValidationHelper {
  static String? validatePhone(BuildContext context, String? value) {
    String pattern = r'^[0-9]';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty || value.length < 9) {
      return 'enter_correct_phone_number';
    } else if (!regExp.hasMatch(value)) {
      return 'enter_valid_phone_number';
    }
    return null;
  }

  static String? validateConfirmPassword(
      String password, String confirmPassword, BuildContext context) {
    if (password != confirmPassword) {
      return 'password_mismatch';
    }
    return null;
  }

  static String? validateFullName(BuildContext context, String? value) {
    if (value!.isEmpty) {
      return 'enter_name';
    } else if (!RegExp(
            r'^[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z]+[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z- _]*$')
        .hasMatch(value)) {
      return 'enter_name';
    }
    return null;
  }

  static String? validateText(BuildContext context, String? value) {
    if (value!.isEmpty) {
      return 'enter_name';
    } else if (!RegExp(
            r'^[0-9\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z]+[\u0600-\u065F\u066A-\u06EF\u06FA-\u06FFa-zA-Z-@!#$ _]*$')
        .hasMatch(value)) {
      return 'enter_wrongly';
    }
    return null;
  }

  static String? validateNumber(BuildContext context, String? value) {
    if (value!.isEmpty) {
      return 'enter_wrongly';
    } else if (!RegExp(r'^[0-9]*$').hasMatch(value)) {
      return 'enter_wrongly';
    }
    return null;
  }

  static String? validateEmail(BuildContext context, String? value) {
    String pattern = r'[@.]';
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty || !regExp.hasMatch(value)) {
      return 'enter_valid_email';
    }
    return null;
  }

  static String? validatePassword(BuildContext context, String? password) {
    if (password!.isEmpty) {
      return 'enter_password';
    } else if (password.length < 6) {
      return 'pw_must_be_min_6_chars';
    } else {
      return null;
    }
  }

  static bool validateResponse(Response response) =>
      response.statusCode >= 200 && response.statusCode < 300;

  static String? validateIsNotEmpty(BuildContext context, String? v) =>
      v!.isEmpty ? 'field_cant_be_empty' : null;
}
