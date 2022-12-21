import '../../product/constants/error_constants.dart';

class SimpleResult<T> {
  final bool isSuccess;
  final ErrorTypes errorType;
  final String? errorMessage;
  final T? data;

  SimpleResult({required this.isSuccess, this.errorType = ErrorTypes.unknown, this.errorMessage, this.data});
}

abstract class GenericResponse<T> {
  T fromJson(Map<String, dynamic> json);
}
