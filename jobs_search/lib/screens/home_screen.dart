import 'package:flutter/material.dart';
import 'package:jobs_search/screens/sec_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UX Designer', style: TextStyle(fontSize: 18)),
        titleSpacing: -10,
        leading: Icon(Icons.arrow_back_ios, size: 20),
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 1,
        actions: [Icon(Icons.close)],
        actionsPadding: EdgeInsets.only(right: 10),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '293 Jobs Found',
                  style: TextStyle(color: Color(0xff3EA3ED)),
                ),
                Icon(Icons.sort, color: Color(0xff3EA3ED)),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.maxFinite,
              color: const Color.fromARGB(255, 247, 247, 255),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Recommended Jobs'),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SecScreen(),
                              ),
                            );
                          },
                          child: Text('see all'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 250,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1.4,
                        ),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Jobs();
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Popular Jobs'),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SecScreen(),
                              ),
                            );
                          },
                          child: Text('see all'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 100,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1.5,
                        ),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Jobs();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Jobs extends StatelessWidget {
  const Jobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(20, 238, 66, 66),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('images/image 5.png', height: 35),
          Text('UX Designer', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('Spotify'),
          Text('\$80.000/y', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
