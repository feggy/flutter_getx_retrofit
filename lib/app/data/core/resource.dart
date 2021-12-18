class Resource<T> {
  final Status? status;
  final T? data;
  final String? message;
  final String? code;

  Resource({
    this.status,
    this.data,
    this.message,
    this.code,
  });

  static Resource<T> loading<T>(T? data) {
    return Resource(status: Status.loading, data: data);
  }

  static Resource<T> success<T>(T? data) {
    return Resource(status: Status.success, data: data);
  }

  static Resource<T> error<T>(String message) {
    return Resource(status: Status.error, data: null, message: message);
  }

  static Resource<T> idle<T>(T? data) {
    return Resource(status: Status.idle, data: data);
  }

  @override
  String toString() {
    return 'Resource(status: $status, data: $data, message: $message, code: $code)';
  }
}

enum Status { idle, loading, success, error }
