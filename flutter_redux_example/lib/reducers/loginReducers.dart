import 'package:flutter_redux_example/main.dart';
import 'package:flutter_redux_example/store/store.dart';
import 'package:flutter_redux_example/actions/loginActions.dart';

GlobalState logInReducer(GlobalState state, dynamic action) {
  if (action == LoginActions.LoggingIn) {
    state.logInProgress = true;
  } else if (action == LoginActions.LoggedIn) {
    state.logInProgress = false;
    state.isLoggedIn = true;
    navigatorKey.currentState?.pushNamed('/home');
  } else if (action == LoginActions.Logout) {
    state.isLoggedIn = false;
    navigatorKey.currentState?.pop();
  }

  return state;
}
