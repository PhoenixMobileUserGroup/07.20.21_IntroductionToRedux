// our initial state
var initialState = {
  customerId: '',
  sessionToken: '',
  isLoading: false,
};

export default function authReducer(state = initialState, action) {
  if (action.type === 'LoggingIn') {
    return {
      ...state,
      isLoading: true,
    };
  } else if (action.type === 'LoggedIn') {
    return {
      ...state,
      isLoading: false,
      customerId: action.customerId,
      sessionToken: action.sessionToken,
    };
  } else if (action.type === 'Logout') {
    return {
      ...state,
      customerId: '',
      sessionToken: '',
      responseToken: '',
    };
  }

  return state; // In case an action is passed in we don't understand
}
