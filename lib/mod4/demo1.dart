void main() {
  //typage classique
  String hello = "Hello world !";
  print(hello);

  //typage optionnel
  var name = "Michel";
  // name = 123;
  name = "Sylvain";

  const age = 18;
  // age = 123; // pas possible

  String? city = null;

  print(city?.toUpperCase());
  print(city!.toUpperCase());

}
