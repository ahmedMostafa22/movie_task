import 'dart:io';

import 'package:alpha/exceptions/exception_widget.dart';
import 'package:flutter/material.dart';

import '../Constants/assets_paths.dart';

class ExceptionHandler {
  static Widget getExceptionWidget(Object exception, void Function() onRetry) {
    String image =
        exception is SocketException ? AssetPaths.noInternet : AssetPaths.error;
    return ExceptionWidget(exception, image, onRetry: onRetry);
  }
}
