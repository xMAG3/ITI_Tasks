import 'package:flutter/material.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50,
          leadingWidth: 85,
          automaticallyImplyLeading: true,

          elevation: 2,
          backgroundColor: Colors.white,
          shadowColor: Colors.grey,
          title: Text(
            'Major',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              padding: EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Text('1 644 ₩', style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.group)),
            IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
          ],
        ),
      ),
    );
  }
}

