import 'package:flutter/material.dart';
import 'ui/colors.dart';
import 'logic/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 1;
  bool listOrder = true;
  List<Customer> customers = getCustomers();
  void nextPage() {
    setState(() {
        _counter++;
    });
  }
  void addToList() {
    setState(() {
      customers = orderList(customers,listOrder);
      listOrder = !listOrder;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: MainColor.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(18),
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  int actualIndex = (index + ((_counter - 1) * 8));
                  if (actualIndex >= customers.length) {
                    return Container(); // Return an empty container if the index is beyond the customer list.
                  }
                  return Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(vertical: 4.0),
                    decoration: BoxDecoration(
                      color: (index % 2 == 1) ? MainColor.evenColor : MainColor.oddColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(child: Text(customers[actualIndex].name)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Stack(
        children: <Widget>[
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              onPressed: addToList,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: FloatingActionButton(
              onPressed: () {
                // Left arrow action
              },
              tooltip: 'Left',
              child: const Icon(Icons.arrow_left),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 80,
            child: FloatingActionButton(
              onPressed: nextPage,
              tooltip: 'Right',
              child: const Icon(Icons.arrow_right),
            ),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
