import 'package:flutter/material.dart';
import 'package:flutter_app3/employeedetails/footer/employee_detail_footer.dart';
import 'package:flutter_app3/employeedetails/employee_detail_body.dart';
import 'package:flutter_app3/employeedetails/header/employee_detail_header.dart';
import 'package:flutter_app3/employee/employee.dart';
import 'package:meta/meta.dart';

class EmployeeDetailsPage extends StatefulWidget {
  EmployeeDetailsPage(
      this.employee, {
        @required this.avatarTag,
      });

  final Employee employee;
  final Object avatarTag;

  @override
  _EmployeeDetailsPageState createState() => new _EmployeeDetailsPageState();
}

class _EmployeeDetailsPageState extends State<EmployeeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    var linearGradient = const BoxDecoration(
      gradient: const LinearGradient(
        begin: FractionalOffset.centerRight,
        end: FractionalOffset.bottomLeft,
        colors: <Color>[
          Colors.brown,
          Colors.black,
        ],
      ),
    );

    return new Scaffold(
      body: new SingleChildScrollView(
        child: new Container(
          decoration: linearGradient,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new EmployeeDetailHeader(
                widget.employee,
                avatarTag: widget.avatarTag,
              ),
              new Padding(
                padding: const EdgeInsets.all(24.0),
                child: new EmployeeDetailBody(widget.employee),
              ),
              new EmployeeShowcase(widget.employee),
            ],
          ),
        ),
      ),
    );
  }
}
