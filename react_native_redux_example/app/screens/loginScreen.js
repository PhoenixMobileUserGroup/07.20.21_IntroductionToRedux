import React, {useState} from 'react';
import {
  ScrollView,
  StyleSheet,
  TextInput,
  Button,
  ActivityIndicator,
} from 'react-native';
import {useDispatch, useSelector} from 'react-redux';
import {LoggingInAction} from '../store/actions/authActions';

const LoginScreen = () => {
  const [email, onChangeEmail] = useState('');
  const [password, onChangePassword] = useState('');
  const isLoading = useSelector(state => state.authState.isLoading);
  var dispatch = useDispatch();

  const submit = () => {
    dispatch(LoggingInAction(email, password));
  };

  return (
    <ScrollView contentContainerStyle={styles.container}>
      <TextInput
        style={styles.input}
        onChangeText={text => onChangeEmail(text)}
        value={email}
        keyboardType="email-address"
      />
      <TextInput
        style={styles.input}
        onChangeText={text => onChangePassword(text)}
        value={password}
        secureTextEntry
      />
      <Button title={'Login'} onPress={submit} />
      {isLoading && <ActivityIndicator />}
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

export default LoginScreen;
