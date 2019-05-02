import 'dart:convert';
import 'package:meta/meta.dart';

class Employee {
  Employee({
    @required this.avatar,
    @required this.name,
    @required this.email,
    @required this.location,
  });

  final String avatar;
  final String name;
  final String email;
  final String location;

  static List<Employee> allFromResponse(String response) {
    var decodedJson = json.decode(response).cast<String, dynamic>();

    return decodedJson['aaData']
        .cast<Map<String, dynamic>>()
        .map((obj) => Employee.fromMap(obj))
        .toList()
        .cast<Employee>();
  }

  static Employee fromMap(Map map) {

    return new Employee(
      avatar: map['url_picture'],
      name : map['fullname'],
      email: map['email'],
      location: map['registerdate'],
    );
  }

  static String _capitalize(String input) {
    return input.substring(0, 1).toUpperCase() + input.substring(1);
  }
}
