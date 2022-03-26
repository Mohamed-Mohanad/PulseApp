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

class AuthRemoveFromMyNetworkLoadingState extends AuthStates {}

class AuthRemoveFromMyNetworkSuccessState extends AuthStates {}

class AuthRemoveFromMyNetworkErrorState extends AuthStates {}

class AuthChangePrivacyLoadingState extends AuthStates {}

class AuthChangePrivacySuccessState extends AuthStates {}

class AuthChangePrivacyErrorState extends AuthStates {}

class AuthGetPatientProfileLoadingState extends AuthStates {}

class AuthGetPatientProfileSuccessState extends AuthStates {}

class AuthGetPatientProfileErrorState extends AuthStates {}


class AuthAddToPatientHistoryLoadingState extends AuthStates {}

class AuthAddToPatientHistorySuccessState extends AuthStates {}

class AuthAddToPatientHistoryErrorState extends AuthStates {}

class AuthActiveHelperLoadingState extends AuthStates {}

class AuthActiveHelperSuccessState extends AuthStates {}

class AuthActiveHelperErrorState extends AuthStates {}