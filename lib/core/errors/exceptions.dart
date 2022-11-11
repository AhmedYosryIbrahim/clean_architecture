import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  final String? message;

  const ServerException([this.message]);

  @override
  // TODO: implement props
  List<Object?> get props => [message];

  @override
  String toString() => '$message';
}

class FetchDataException extends ServerException {
  const FetchDataException([message]) : super('Error During Communication');
}

class BadRequestException extends ServerException {
  const BadRequestException([message]) : super('Bad Request');
}
class UnauthorizedException extends ServerException {
  const UnauthorizedException([message]) : super('Unauthorized');
}
class NotFoundException extends ServerException {
  const NotFoundException([message]) : super('Not Found');
}

class ForbiddenException extends ServerException {
  const ForbiddenException([message]) : super('Forbidden');
}

class ConflictException extends ServerException {
  const ConflictException([message]) : super('Conflict');
}

class InternalServerErrorException extends ServerException {
  const InternalServerErrorException([message]) : super('Internal Server Error');
}
class NoInternetException extends ServerException {
  const NoInternetException([message]) : super('No Internet');
}

class CachedException implements Exception {}
