import 'package:classapp/ui/widgets/customtabbar.dart';
import 'package:classapp/ui/widgets/time_table_card.dart';
import 'package:dot_tab_indicator/dot_tab_indicator.dart';
import 'package:flutter/material.dart';

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
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: _tabs.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

          body: TimeTableCard(),
    );
  }
}
