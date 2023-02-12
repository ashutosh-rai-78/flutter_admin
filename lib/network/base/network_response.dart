class NetworkResponse<T>{
  final bool isSuccess;
  final T? body;
  T get requireBody => body!;
  final int errorCode;
  final String? errorMessage;

  NetworkResponse.success({required this.body}): isSuccess = true, errorCode = 0, errorMessage = null;

  NetworkResponse.error({required this.errorCode, this.errorMessage}): isSuccess = false, body = null;
}

