import 'error_message.dart';

class APIResponse<T> {
  bool success;
  T? data;
  String? message;
  ErrorMessages? errors;

  APIResponse({required this.success, this.data, this.message, this.errors});

  factory APIResponse.fromJson(Map<String, dynamic> json, Function? builder) {
    return APIResponse(
      success: json['success'] != null ? json['success'] as bool : false,
      data : (builder == null || json['data'] == null)
          ? json['data']
          : builder(json['data']),
      message: json['message'] == null ? null : (json['message']),
      errors: json['errors'] == null ? null : ErrorMessages.fromJson(json['errors']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> jsonData = <String, dynamic>{};
    jsonData['data'] = data;
    jsonData['message'] = message;
    jsonData['errors'] = errors?.toJson();
    jsonData['success'] = success;
    return jsonData;
  }
}
