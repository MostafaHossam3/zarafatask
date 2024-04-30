class ServerException implements Exception {
  // int code;
  List<String> messages;

  ServerException({/*required this.code, */ required this.messages});
}

class CacheException implements Exception {
  // int code;
  String message;

  CacheException({/*required this.code, */ required this.message});
}
