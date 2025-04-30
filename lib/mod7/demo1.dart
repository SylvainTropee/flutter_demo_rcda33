import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppHomePage(title: "Démo Form"),
    );
  }
}

class AppHomePage extends StatelessWidget {
  String title;

  AppHomePage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(this.title),
        ),
        body: DemoForm());
  }
}

class DemoForm extends StatefulWidget {
  @override
  State<DemoForm> createState() => _DemoFormState();
}

class _DemoFormState extends State<DemoForm> {
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  bool isOk = false;
  String radioValue = "true";
  String name = "", age = "", sport = "";

  var nameController = TextEditingController();

  void updateRadioValue(value) {
    setState(() {
      radioValue = value!;
    });
  }

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Veuillez remplir votre nom !";
    }
    if (value.length < 2) {
      return "Votre nom doit contenir au moins 2 caractères !";
    }
    return null;
  }

  String? validateAge(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Veuillez remplir votre age !";
    }
    if (int.parse(value) < 0) {
      return "Votre age ne peut être négatif !";
    }
    return null;
  }

  String? validateSport(String? value) {
    if (value == null) {
      return "Veuillez choisir un sport !";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _keyForm,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                onSaved: (value) {
                  name = value!;
                },
                validator: validateName,
                decoration: InputDecoration(
                    labelText: "Name", hintText: "Veuillez saisir votre nom"),
              ),
              TextFormField(
                onChanged: (value){
                  //lis en direct le champ associé
                  print(nameController.text);
                },
                onSaved: (value){
                  age = value!;
                },
                validator: validateAge,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Age", hintText: "Veuillez saisir votre age"),
              ),
              DropdownButtonFormField<String?>(
                  validator: validateSport,
                  onSaved: (value){
                    sport = value!;
                  },
                  items: [
                    DropdownMenuItem(
                        child: Text("-Choisir un sport-"), value: null),
                    DropdownMenuItem(child: Text("Curling"), value: "curling"),
                    DropdownMenuItem(
                        child: Text("Air Poney"), value: "airPoney"),
                    DropdownMenuItem(
                        child: Text("Quidditch"), value: "quidditch"),
                    DropdownMenuItem(child: Text("Disco foot"), value: "ds"),
                  ],
                  onChanged: (value) {}),
              Row(
                children: [
                  Checkbox(
                      value: isOk,
                      onChanged: (checked) {
                        setState(() {
                          isOk = checked!;
                        });
                      }),
                  Text("La <form> ?")
                ],
              ),
              Row(
                children: [
                  Text("Vrai"),
                  Radio<String>(
                      value: "true",
                      groupValue: radioValue,
                      onChanged: updateRadioValue),
                  Text("Faux"),
                  Radio<String>(
                      value: "false",
                      groupValue: radioValue,
                      onChanged: updateRadioValue),
                ],
              ),
              ElevatedButton(
                  onPressed: () {
                    //déclenche les validations (validator attribute)
                    if (_keyForm.currentState!.validate()) {
                      //déclanche la sauvegarde des données (onSaved attribute)
                      _keyForm.currentState!.save();

                      //on crée un json et on envoie !
                      print(name);
                      print(sport);
                      print(age);

                    }
                  },
                  child: Text("Valider !"))
            ],
          ),
        ));
  }
}
