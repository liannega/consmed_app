class CustomResponse<T> {
  final T? data;
  final String? message;
  final int status;

  CustomResponse({
    this.data,
    this.message,
    required this.status,
  });

  bool get isSuccess => status >= 200 && status < 300;
  bool get isError => !isSuccess;

}