import 'package:flutter/material.dart';
import 'package:flutter_app3/employeedetails/footer/articles_showcase.dart';
import 'package:flutter_app3/employeedetails/footer/portfolio_showcase.dart';
import 'package:flutter_app3/employeedetails/footer/skills_showcase.dart';
import 'package:flutter_app3/employee/employee.dart';

class EmployeeShowcase extends StatefulWidget {
  EmployeeShowcase(this.employee);

  final Employee employee;

  @override
  _EmployeeShowcaseState createState() => new _EmployeeShowcaseState();
}

class _EmployeeShowcaseState extends State<EmployeeShowcase>
    with TickerProviderStateMixin {
  List<Tab> _tabs;
  List<Widget> _pages;
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _tabs = [
      new Tab(text: 'Portfolio'),
      new Tab(text: 'Skills'),
      new Tab(text: 'Articles'),
    ];
    _pages = [
      new PortfolioShowcase(),
      new SkillsShowcase(),
      new ArticlesShowcase(),
    ];
    _controller = new TabController(
      length: _tabs.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(16.0),
      child: new Column(
        children: <Widget>[
          new TabBar(
            controller: _controller,
            tabs: _tabs,
            indicatorColor: Colors.white,
          ),
          new SizedBox.fromSize(
            size: const Size.fromHeight(300.0),
            child: new TabBarView(
              controller: _controller,
              children: _pages,
            ),
          ),
        ],
      ),
    );
  }
}
