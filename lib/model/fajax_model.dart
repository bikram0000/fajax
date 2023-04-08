class FajaxModel {
  String baseUrl;
  dynamic body;
  Map<String, dynamic> params;
  Map<String, dynamic> headers;
  String method;

  FajaxModel({
    required this.baseUrl,
    required this.body,
    required this.params,
    required this.headers,
    required this.method,
  });

  Map<String, dynamic> toJson() {
    return {
      'baseUrl': baseUrl,
      'body': body,
      'params': params,
      'headers': headers,
      'method': method,
    };
  }
}
