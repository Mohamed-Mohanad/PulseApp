import 'package:flutter_bloc/flutter_bloc.dart';

import 'onboarding_states.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates> {
  OnBoardingCubit() : super(OnBoardingInitialState());

  static OnBoardingCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  void changeBoard(int index) {
    currentIndex = index;
    emit(ChangeBoardState());
  }
}
