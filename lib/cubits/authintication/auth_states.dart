abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class AuthLoginLoadingState extends AuthStates {}

class AuthLoginSuccessState extends AuthStates {}

class AuthLoginErrorState extends AuthStates {}

class AuthRegisterLoadingState extends AuthStates {}

class AuthRegisterSuccessState extends AuthStates {}

class AuthRegisterErrorState extends AuthStates {}

class AuthGetNetworkSuccessState extends AuthStates {}


class AuthAddToMyNetworkLoadingState extends AuthStates {}

class AuthAddToMyNetworkSuccessState extends AuthStates {}

class AuthAddToMyNetworkErrorState extends AuthStates {}