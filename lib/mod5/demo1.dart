import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo layout",
      home: AppHomePage(),
    );
  }
}

class AppHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bienvenue sur cette application"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Alcool",
                style:
                    TextStyle(color: Colors.pinkAccent.shade400, fontSize: 36)),
            SizedBox(height: 2500),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text("Cigarettes"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Text("Poppers"), Text("5€")],
            ),
            FlexWidget()
          ],
        ),
      ),
    );
  }
}

class FlexWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("Flex 1"),
        Text("Flex 2"),
      ],
    );
  }
}
