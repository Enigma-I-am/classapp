import 'package:classapp/core/viewmodels/timetableviewmodel.dart';
import 'package:classapp/ui/screens/timetablescreens/friday_timetable_screen.dart';
import 'package:classapp/ui/screens/timetablescreens/monday_timetable_screen.dart';
import 'package:classapp/ui/screens/timetablescreens/thursday_timetable_screen.dart';
import 'package:classapp/ui/screens/timetablescreens/tuesday_timetable_screen.dart';
import 'package:classapp/ui/screens/timetablescreens/wednesday_timetable_screen.dart';
import 'package:classapp/ui/widgets/customtabbar.dart';

import 'package:dot_tab_indicator/dot_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/viewmodel_provider.dart';

import '../../locator.dart';

class MainTimeTableScreen extends StatefulWidget {
  @override
  _MainTimeTableScreenState createState() => _MainTimeTableScreenState();
}

class _MainTimeTableScreenState extends State<MainTimeTableScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  List<Tab> _tabs = <Tab>[
    Tab(text: "mon"),
    Tab(text: "tues"),
    Tab(text: "wed"),
    Tab(text: "thur"),
    Tab(text: "fri"),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabs.length);
  }

  final mondayViewmodel = locator<TimeTableViewmodel>();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<TimeTableViewmodel>.withConsumer(
        viewModel: mondayViewmodel,
        builder: (context, model, child) => DefaultTabController(
              length: 5,
              child: Scaffold(
                appBar: CustomAppBar(
                    child: TabBar(
                      indicator: DotTabIndicator(
                        indicatorColor: Colors.blueAccent,
                        radius: kDefaultDotIndicatorRadius,
                      ),
                      indicatorWeight: 2 * kDefaultDotIndicatorRadius,
                      labelColor: Colors.white,
                      isScrollable: true,
                      // labelPadding: EdgeInsets.only(left: 10, right: 10),
                      tabs: _tabs,
                      controller: _tabController,
                    ),
                    height: MediaQuery.of(context).size.height * 0.12),
                body: model.busy == true
                    ? CircularProgressIndicator()
                    : TabBarView(
                        controller: _tabController,
                        children: <Widget>[
                          MondayTimeTableScreen(model.getMondays()),
                          TuesdayTimeTableScreen(model.getTuesdays()),
                          WednesdayTimeTableScreen(model.getWednesdays()),
                          ThursdayTimeTableScreen(model.getThursdays()),
                          FridayTimeTableScreen(model.getFridays())
                        ],
                      ),
              ),
            ));
  }
}
