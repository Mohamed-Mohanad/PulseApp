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
      'الحمدلله',
      'الحمدلله',
      'الحمدلله',
    ],
    question: 'عامل ايه',
  ),
  NormalQuestion(
    choices: [
      'الحمدلله',
      'الحمدلله',
      'الحمدلله',
      'الحمدلله',
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
    question: 'انت كويس',
  ),
];
