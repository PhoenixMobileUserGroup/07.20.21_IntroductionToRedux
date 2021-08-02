import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_example/actions/loginActions.dart';
import 'package:flutter_redux_example/store/store.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Center(
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.all(36),
          child: StoreConnector<GlobalState, VoidCallback>(
            converter: (store) {
              return () => store.dispatch(LoginActions.Logout);
            },
            builder: (context, callback) {
              return ElevatedButton(
                child: const Text('Logout'),
                onPressed: callback,
              );
            },
          ),
        ),
      ),
    ));
  }
}
