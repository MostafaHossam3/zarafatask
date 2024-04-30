class ErrorMessages {
  List<String> errors;

  ErrorMessages({
    this.errors = const [],
  });

  factory ErrorMessages.fromJson(data) {
    return ErrorMessages(
      errors: List<String>.from(data.map((e) => e.toString()))
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'errors' : errors
    };
  }

  @override
  String toString() {
    return 'ErrorMessage{errors: $errors}';
  }
}
