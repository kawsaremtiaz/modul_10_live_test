import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Selection Screen',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<ItemModel> _items = [
    ItemModel('Item 1'),
    ItemModel('Item 2'),
    ItemModel('Item 3'),
    ItemModel('Item 4'),
    ItemModel('Item 5'),
    ItemModel('Item 6'),
    ItemModel('Item 7'),
    ItemModel('Item 8'),
    ItemModel('Item 9'),
    ItemModel('Item 10'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selection Screen'),
        centerTitle: false,
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_items[index].name),
            onTap: () {
              setState(() {
                _items[index].isSelected = !_items[index].isSelected;
              });
            },
            tileColor: _items[index].isSelected ? Colors.blueAccent : null,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          int selectedCount = _items.where((item) => item.isSelected).length;
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Selected Items'),
                content: Text('Number of selected items: $selectedCount'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}

class ItemModel {
  String name;
  bool isSelected;
  ItemModel(this.name, {this.isSelected = false});
}
