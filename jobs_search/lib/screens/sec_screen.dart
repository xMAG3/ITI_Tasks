import 'package:flutter/material.dart';
import 'package:jobs_search/screens/home_screen.dart';

class SecScreen extends StatelessWidget {
  const SecScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UX Designer', style: TextStyle(fontSize: 18)),
        titleSpacing: -10,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          icon: Icon(Icons.arrow_back_ios, size: 20),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 1,
        actions: [Icon(Icons.close)],
        actionsPadding: EdgeInsets.only(right: 10),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '293 Jobs Found',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 10, 88, 151),
                  ),
                ),
                Icon(
                  Icons.more_vert,
                  size: 22,
                  color: const Color.fromARGB(255, 10, 88, 151),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 1,
                  childAspectRatio: 3,
                ),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return JobSec();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class JobSec extends StatelessWidget {
  const JobSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(20, 67, 164, 3),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset('images/logos_dribbble-icon.png', height: 35),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'UX Designer',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('Dribble'),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('\$90.000/y', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Florida, US'),
            ],
          ),
        ],
      ),
    );
  }
}
