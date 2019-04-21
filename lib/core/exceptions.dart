class PermissionException implements Exception {
  final String message;

  const PermissionException([this.message = '']);

  String toString() => this.message;
}

class UnknownException implements Exception {
  final String message;

  const UnknownException([this.message = '' ?? 'Tivemos um problema, tente novamente mais tarde']);

  String toString() => this.message;
}

class NotFoundException implements Exception {
  final String message;

  const NotFoundException([this.message = '']);

  String toString() => this.message;
}

class BadRequestException implements Exception {
  final String message;

  const BadRequestException(
      [this.message = '']);

  String toString() => this.message;
}
