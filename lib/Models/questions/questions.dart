class Question {
  final String question;
  final List<String> choices;

  Question({
    required this.question,
    required this.choices,
  });
}

List<Question> questions = [
  Question(
    choices: [
      'الحمدلله',
      'كويس',
      'انت ايه اخبارك',
      'يارب دايما',
    ],
    question: 'ازيك',
  ),
  Question(
    choices: [
      'بخير',
      'الحمدلله',
      'انت عامل ايه',
      'طب الحمدلله',
    ],
    question: 'عامل ايه',
  ),
  Question(
    choices: [
      'الحمدلله',
      'الحمدلله برضو',
    ],
    question: 'انت كويس',
  ),
  Question(
    choices: [
      'الحمدلله',
      'الحمدلله برضو',
    ],
    question: 'انت عامل ايه',
  ),
];
