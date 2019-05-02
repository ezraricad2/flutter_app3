import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app3/employeedetails/employee_details_page.dart';
import 'package:flutter_app3/employee/employee.dart';

class EmployeeListPage extends StatefulWidget {
  static String tag = 'list_employee';

  @override
  _EmployeeListPageState createState() => new _EmployeeListPageState();
}

class _EmployeeListPageState extends State<EmployeeListPage> {
  List<Employee> _friends = [];

  @override
  void initState() {
    super.initState();
    _loadFriends();
  }

  Future<void> _loadFriends() async {
    http.Response response =
    await http.get('http://simplesolutionapps.com/APISample/MainController/forjson');

    setState(() {
      _friends = Employee.allFromResponse(response.body);
    });
  }

  Widget _buildFriendListTile(BuildContext context, int index) {
    var employee = _friends[index];

    return new ListTile(
      onTap: () => _navigateToFriendDetails(employee, index),
      leading: new Hero(
        tag: index,
        child: new CircleAvatar(
          backgroundImage: new NetworkImage(employee.avatar),
        ),
      ),
      title: new Text(employee.name),
      subtitle: new Text(employee.email),
    );
  }

  void _navigateToFriendDetails(Employee employee, Object avatarTag) {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (c) {
          return new EmployeeDetailsPage(employee, avatarTag: avatarTag);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (_friends.isEmpty) {
      content = new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      content = new ListView.builder(
        itemCount: _friends.length,
        itemBuilder: _buildFriendListTile,
      );
    }

    return new Scaffold(
      appBar: new AppBar(title: new Text('Employee')),
      body: content,
    );
  }
}
