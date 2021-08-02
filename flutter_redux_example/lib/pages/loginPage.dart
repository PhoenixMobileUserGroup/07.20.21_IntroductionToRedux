import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_example/actions/loginActions.dart';
import 'package:flutter_redux_example/store/store.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Center(
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.all(36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 45.0),
              TextField(
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
              ),
              SizedBox(height: 20.0),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
              ),
              SizedBox(height: 20.0),
              Container(
                width: 200,
                child: StoreConnector<GlobalState, VoidCallback>(
                  converter: (store) {
                    return () => store.dispatch(LoginActions.LoggingIn);
                  },
                  builder: (context, callback) {
                    return ElevatedButton(
                      child: const Text('Login'),
                      onPressed: callback,
                    );
                  },
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                child: StoreConnector<GlobalState, bool>(
                  converter: (store) {
                    return store.state.logInProgress;
                  },
                  builder: (context, logInProgress) {
                    return Visibility(
                      child: Container(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator()),
                      visible: logInProgress,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
