import {takeEvery, all} from 'redux-saga/effects';
import {logIn, logOut} from './authSaga';

export default function* watch() {
  yield all([
    // add here more sagas
    takeEvery('LoggingIn', logIn),
    takeEvery('Logout', logOut),
  ]);
}
