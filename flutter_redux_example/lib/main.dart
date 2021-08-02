import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_example/middleware/authMiddleware.dart';
import 'package:flutter_redux_example/pages/homePage.dart';
import 'package:redux/redux.dart';

import 'package:flutter_redux_example/reducers/loginReducers.dart';
import 'package:flutter_redux_example/store/store.dart';
import 'package:flutter_redux_example/pages/loginPage.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

void main() {
  final store = Store<GlobalState>(
    logInReducer,
    initialState: GlobalState(),
    middleware: [
      AuthMiddleware(),
    ],
  );
  runApp(FlutterReduxExampleApp(store: store));
}

class FlutterReduxExampleApp extends StatelessWidget {
  final Store<GlobalState> store;

  FlutterReduxExampleApp({
    Key? key,
    required this.store,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<GlobalState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Redux Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage(title: 'Flutter Demo Home Page'),
        navigatorKey: navigatorKey,
        routes: <String, WidgetBuilder>{
          '/login': (BuildContext context) => LoginPage(title: 'Login'),
          '/home': (BuildContext context) => HomePage(title: 'Home'),
        },
      ),
    );
  }
}
