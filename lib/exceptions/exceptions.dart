import 'dart:async';
import 'dart:io';

class AppExceptions {
  static final Exception defaultException = Exception('Something went wrong');
  static final Exception authorizationException =
      Exception('Unauthorized User');
  static final Exception timeOutException =
      TimeoutException('Request timed out');
  static final Exception parsingException = Exception('Error parsing data');
  static final Exception internalServerError =
      Exception('Internal server error');
  static const SocketException networkError =
      SocketException('Network connection error');
}
