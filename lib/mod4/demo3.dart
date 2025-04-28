enum CartoonType { Comedy, Drama, Dummy, Horror }

class Cartoon {
  String name = "";
  int duration = 0;
  CartoonType type = CartoonType.Comedy;
  String _test = "";

  Cartoon(
      {required this.name,
      required this.duration,
      this.type = CartoonType.Comedy});

  Cartoon.fromJson(Map<String, dynamic> json){
    this.name = json['name'];
    this.duration = json['duration'];
    this.type = json['type'];
  }

  @override
  String toString() {
    return 'Cartoon{name: $name, duration: $duration, type: $type}';
  }

  String get test => _test;

  set test(String value) {
    _test = value;
  }

  set setDuration(int duration){
    this.duration = duration;
  }

  int get getDuration{
    return this.duration;
  }

}

void main() {
  Cartoon shrek = Cartoon(name: "Shrek", duration: 120);
  print(shrek.toString());
  shrek.duration = 150;
  print(shrek.toString());
  shrek.setDuration = 250;
  print(shrek.toString());

  Cartoon mulan = Cartoon.fromJson(
      {'name': 'Mulan', 'duration': 120, 'type': CartoonType.Drama});

  print(mulan);
}




















