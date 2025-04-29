import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo layout",
      home: AppHomePage(title: "Demo état"),
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
        body: PasswordWidget(label: "Mot de passe"));
  }
}

class PasswordWidget extends StatefulWidget {

  String label;

  PasswordWidget({required this.label});

  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  bool isVisible = false;

  void toggleVisibility(bool value) {
    setState(() {
      isVisible = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            obscureText: !isVisible,
            decoration: InputDecoration(label: Text(widget.label)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(isVisible ? Icons.lock_open : Icons.lock),
              Switch(value: isVisible, onChanged: toggleVisibility)
            ],
          )
        ],
      ),
    );
  }
}
