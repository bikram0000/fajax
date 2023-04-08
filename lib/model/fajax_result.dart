class FajaxResult {
  dynamic response;
  Map<String, dynamic> info;

  FajaxResult({required this.response, required this.info});

  factory FajaxResult.fromJson(Map<String, dynamic> json) {
    return FajaxResult(
      response: json['response'],
      info: json['info'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['response'] = response;
    data['info'] = info;
    return data;
  }
}
