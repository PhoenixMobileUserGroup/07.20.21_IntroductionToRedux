import {put, call} from 'redux-saga/effects';
import {logInCall} from '../../services/authService';
import * as RootNavigation from '../../navigation/rootNavigation';
import {LoggedInAction, LoggingInFailedAction} from '../actions/authActions';

const delay = ms => new Promise(res => setTimeout(res, ms));

export function* logIn(action) {
  try {
    yield delay(4000);
    const response = yield call(logInCall, action.username, action.password);
    console.log(response);
    RootNavigation.navigate('Home', undefined);
    console.log('cool');
    yield put(LoggedInAction(response.customerId, response.sessionToken));
  } catch (e) {
    yield put(LoggingInFailedAction());
  }
}

export function logOut() {
  RootNavigation.navigate('Login', undefined);
}
