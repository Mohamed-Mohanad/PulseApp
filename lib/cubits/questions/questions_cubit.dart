import 'package:flutter_bloc/flutter_bloc.dart';

import 'questions_states.dart';

class QuestionsCubit extends Cubit<QuestionsStates> {
  QuestionsCubit() : super(QuestionsInitialState());

  static QuestionsCubit get(context) => BlocProvider.of(context);

  int questionIndex = 0;
  void changeQuestion(int index) {
    questionIndex = index;
    emit(ChangeQuestionState());
  }
}
