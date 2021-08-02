import {applyMiddleware, createStore} from 'redux';
import {persistStore, persistCombineReducers} from 'redux-persist';
import createSagaMiddleware from 'redux-saga';
import AsyncStorage from '@react-native-community/async-storage';
// we make sure to rename the reducer here
import {authReducer as authState} from './reducers';
import sagas from './sagas';

const persistConfig = {
  key: 'root',
  storage: AsyncStorage,
  debug: true,
};

// we reefined the name of the reducer before combining so the state has a proper name
const persistedReducer = persistCombineReducers(persistConfig, {authState});

// add saga middleware and create store
const sagaMiddleware = createSagaMiddleware();
const enhancer = applyMiddleware(sagaMiddleware);
let store = createStore(persistedReducer, undefined, enhancer);
let persistor = persistStore(store, {enhancers: enhancer}, () => {
  console.log('Current State', store.getState());
});
persistor.purge();
sagaMiddleware.run(sagas);

export default () => {
  return {store, persistor};
};
