class NormalQuestion {
  final String question;
  final List<String> choices;

  NormalQuestion({
    required this.question,
    required this.choices,
  });
}

List<NormalQuestion> normalQuestions = [
  NormalQuestion(
    choices: [
      'الحمدلله',
      'كويس',
      'انت ايه اخبارك',
      'يارب دايما',
    ],
    question: 'ازيك',
  ),
  NormalQuestion(
    choices: [
      'بخير',
      'الحمدلله',
      'انت عامل ايه',
      'طب الحمدلله',
    ],
    question: 'عامل ايه',
  ),
  NormalQuestion(
    choices: [
      'الحمدلله',
      'كويس',
      'انت ايه اخبارك',
      'يارب دايما',
    ],
    question: 'ازيك',
  ),
  NormalQuestion(
    choices: [
      'بخير',
      'الحمدلله',
      'انت عامل ايه',
      'طب الحمدلله',
    ],
    question: 'عامل ايه',
  ),
];

class BooleanQuestion {
  final String question;
  final List<String> choices;

  BooleanQuestion({
    required this.question,
    required this.choices,
  });
}

List<BooleanQuestion> booleanQuestions = [
  BooleanQuestion(
    choices: [
      'الحمدلله',
      'الحمدلله برضو',
    ],
    question: 'انت كويس',
  ),
  BooleanQuestion(
    choices: [
      'الحمدلله',
      'الحمدلله برضو',
    ],
    question: 'انت عامل ايه',
  ),
  BooleanQuestion(
    choices: [
      'الحمدلله',
      'الحمدلله برضو',
    ],
    question: 'انت كويس',
  ),
  BooleanQuestion(
    choices: [
      'الحمدلله',
      'الحمدلله برضو',
    ],
    question: 'انت عامل ايه',
  ),
];
