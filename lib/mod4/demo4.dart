Future<void> waitALittleBit() async {
  print("Avant");
  await Future.delayed(Duration(seconds: 3));
  print("Après");
}

Future<String> getAsyncName() async{
  return "Michel";
}

void main() async{
  await waitALittleBit();
  getAsyncName().then((value) => print(value));
}
