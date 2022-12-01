import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

export 'package:fluro/fluro.dart';

mixin AppNavigator on Widget {
  void navigateTo(
    BuildContext context,
    String path, {
    bool replace = false,
    bool clearStack = false,
    bool maintainState = true,
    bool rootNavigator = false,
    TransitionType? transition = TransitionType.native,
    RouteSettings? routeSettings,
  }) {
    final FluroRouter router = GetIt.I.get();
    router.navigateTo(
      context,
      path,
      replace: replace,
      clearStack: clearStack,
      transition: transition,
      rootNavigator: rootNavigator,
      routeSettings: routeSettings,
    );
  }

  void push(
    BuildContext context,
    String path, {
    bool replace = false,
    bool clearStack = false,
    bool maintainState = true,
    bool rootNavigator = false,
    RouteSettings? routeSettings,
    TransitionType? transition = TransitionType.native,
  }) {
    navigateTo(
      context,
      path,
      replace: replace,
      clearStack: clearStack,
      transition: transition,
      maintainState: maintainState,
      rootNavigator: rootNavigator,
      routeSettings: routeSettings,
    );
  }

  void pushReplacement(
    BuildContext context,
    String path, {
    bool replace = false,
    bool clearStack = true,
    bool maintainState = false,
    bool rootNavigator = false,
    RouteSettings? routeSettings,
    TransitionType? transition = TransitionType.native,
  }) {
    navigateTo(
      context,
      path,
      replace: replace,
      clearStack: clearStack,
      transition: transition,
      maintainState: maintainState,
      rootNavigator: rootNavigator,
      routeSettings: routeSettings,
    );
  }

  void present(
    BuildContext context,
    String path, {
    bool replace = false,
    bool clearStack = false,
    bool maintainState = true,
    bool rootNavigator = false,
    RouteSettings? routeSettings,
    TransitionType? transition = TransitionType.native,
  }) {
    navigateTo(
      context,
      path,
      replace: replace,
      clearStack: clearStack,
      transition: transition,
      maintainState: maintainState,
      rootNavigator: rootNavigator,
      routeSettings: routeSettings,
    );
  }

  void pop(BuildContext context, [value]) {
    Navigator.pop(context, value);
  }
}
