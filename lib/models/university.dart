import 'dart:developer';

class University {
  University({
    required this.name,
    required this.country,
    required this.url,
  });

  final String name;
  final String country;
  final String url;

  factory University.fromJson(Map<String, dynamic> json) {
    return University(
      name: json['name'],
      country: json['country'],
      url: json['web_pages'][0],
    );
  }
}
