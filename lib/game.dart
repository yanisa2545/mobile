import 'dart:math';

enum Result {
  tooHigh,
  tooLow,
  correct
}

class Game {
  static const defaultMaxRandom = 100;
  int? answer;
  int _guessCount = 0;
  static final List<int> guessCountList = [];

  Game({int maxRandom = defaultMaxRandom}) {
    var r = Random();
    answer = r.nextInt(maxRandom) + 1;
    print('The answer is answer');
  }

  int get guessCount {
    return _guessCount;
  }
  int?  anwer(){
    return answer;
  }
  void addCountList() {
    guessCountList.add(_guessCount);
  }

  Result doGuess(int num) {
    _guessCount++;
    if (num > answer!) {
      return Result.tooHigh;
    } else if (num < answer!) {
      return Result.tooLow;
    } else {
      return Result.correct;
    }
  }
}