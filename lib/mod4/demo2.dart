

void main(){
  displayMessage("Salut", 5);
  displayMessage2("Hello");
  displayMessage2("Hey", number: 2);
  displayMessage3(number: 2, message: getMessage("Coucou"));
}

void displayMessage(String message, int number){
  for(int i = 0; i < number; i++){
      print(message);
  }
}
void displayMessage2(String message, {int number = 1}){
  for(int i = 0; i < number; i++){
    print(message);
  }
}
void displayMessage3({required String message, int number = 1}){
  for(int i = 0; i < number; i++){
    print(message);
  }
}
String getMessage(String message){
  return message;
}