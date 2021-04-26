import 'dart:math';

class Brain {
  final int weight;
  final int height;
  Brain({this.weight, this.height});
  double _ans = 0.0;

  String answer() {
    _ans = weight / pow(height / 100, 2);
    return _ans.toStringAsFixed(1);
  }

  String gethealthlable() {
    if (_ans < 18.5) {
      return 'UNDERWEIGHT';
    } else if (_ans <= 25) {
      return 'NORMAL';
    } else {
      return 'OVERWEIGHT';
    }
  }

  String getadvice() {
    if (_ans < 18.5) {
      return 'It is better to be skinny than to be fat, but you should eat bit more !';
    } else if (_ans <= 25) {
      return 'Cool! ,You have normal body weight !';
    } else {
      return 'You can have your cake and lose weight, too! and you can do it !';
    }
  }
}
