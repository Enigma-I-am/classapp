import 'package:classapp/constants/route_names.dart';
import 'package:flutter/material.dart';

class NavigationService {
  GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  bool pop() {
    return _navigationKey.currentState.pop();
  }

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateReplacmentTo(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateReplacmentToAndRemoveHistory(String routeName,
      {dynamic arguments}) {
    return _navigationKey.currentState
        .pushNamedAndRemoveUntil(HomeViewRoute, (Route route) => false);
  }
}
