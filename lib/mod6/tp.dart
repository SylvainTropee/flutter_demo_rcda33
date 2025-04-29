import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppHomePage(title: "Panier d'articles"),
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
      body: ArticleList(),
    );
  }
}

class ArticleList extends StatefulWidget {
  @override
  State<ArticleList> createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {

  double total = 0.0;

  void updateTotal(double price){
    setState(() {
      total += price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Article("Clavier", 12.50, updateTotal),
      Article("Souris", 33.33, updateTotal),
      Article("RAM 256 GO", 0.50, updateTotal),
      Article("Burger savoyard", 12, updateTotal),
      Text("Total = $total €")
    ]);
  }
}

class Article extends StatefulWidget {
  final String name;
  final double price;
  final Function(double) priceChange;

  Article(this.name, this.price, this.priceChange);

  @override
  State<Article> createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  int quantityCount = 0;

  double getTotal() {
    return widget.price * quantityCount;
  }

  void increment() {
    setState(() {
      quantityCount++;
      widget.priceChange(widget.price);
    });
  }

  void decrement() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
        widget.priceChange(-widget.price);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(widget.name),
          Text("${widget.price} €"),
          ElevatedButton(onPressed: increment, child: Icon(Icons.add)),
          Text("$quantityCount"),
          ElevatedButton(onPressed: decrement, child: Icon(Icons.minimize)),
          Text("Total = ${getTotal()} €")
        ],
      ),
    );
  }
}
