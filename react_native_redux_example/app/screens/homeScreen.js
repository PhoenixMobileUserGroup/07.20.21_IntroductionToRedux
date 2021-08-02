import React, {useState} from 'react';
import {ScrollView, StyleSheet, TextInput, Button, Text} from 'react-native';
import {LogoutAction} from '../store/actions/authActions';
import {useDispatch, useSelector} from 'react-redux';

const HomeScreen = ({}) => {
  var dispatch = useDispatch();
  const {customerId, sessionToken} = useSelector(state => state.authState);
  return (
    <ScrollView contentContainerStyle={styles.container}>
      <Text>customerId: {customerId}</Text>
      <Text>sessionToken: {sessionToken}</Text>
      <Button
        title={'Go Back'}
        onPress={() => {
          // logout
          dispatch(LogoutAction());
        }}
      />
    </ScrollView>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  input: {
    height: 40,
    width: 300,
    borderColor: 'gray',
    borderWidth: 1,
    marginTop: 20,
  },
});

export default HomeScreen;
