import 'dart:async';
import 'package:flutter_redux_example/actions/loginActions.dart';
import 'package:flutter_redux_example/store/store.dart';
import 'package:redux/redux.dart';

/// The Search Middleware will listen for Search Actions and perform the search
/// after the user stop typing for 250ms.
///
/// If a previous search was still loading, we will cancel the operation and
/// fetch a set of results. This ensures only results for the latest search
/// term are shown.
class AuthMiddleware implements MiddlewareClass<GlobalState> {
  Timer? _timer;

  AuthMiddleware();

  @override
  void call(Store<GlobalState> store, dynamic action, NextDispatcher next) {
    if (action == LoginActions.LoggingIn) {
      // Stop our previous debounce timer and search.
      _timer?.cancel();

      _timer = Timer(Duration(milliseconds: 4000), () {
        store.dispatch(LoginActions.LoggedIn);
      });
    }

    // Make sure to forward actions to the next middleware in the chain!
    next(action);
  }
}
