export function LoggingInAction(username, password) {
  return {
    type: 'LoggingIn',
    username,
    password,
  };
}

export function LoggingInFailedAction() {
  return {
    type: 'LoggingInFailed',
  };
}

export function LoggedInAction(customerId, sessionToken) {
  return {
    type: 'LoggedIn',
    customerId,
    sessionToken,
  };
}

export function LogoutAction() {
  return {
    type: 'Logout',
  };
}
