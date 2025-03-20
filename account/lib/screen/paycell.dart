import 'package:flutter/material.dart';

class PayCell extends StatelessWidget {
  const PayCell({super.key});

  @override
  Widget build(BuildContext context) {
    const String user = 'Mag';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'paycell',
          style: TextStyle(
            fontSize: 22,
            color: Colors.lightBlueAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(child: Icon(Icons.person)),
                SizedBox(width: 10),
                Text(
                  'Welcome $user!',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Icon(Icons.notifications),
              ],
            ),

            SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: _accountCard(
                    'Paycell Account',
                    "22060\$",
                    'Load Money',
                    Colors.blue,
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: _accountCard(
                    'Digital Account',
                    "20000\$",
                    'Invest',
                    Colors.purpleAccent,
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            Text(
              "Transactions",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              children: [
                _buildTransactionIcon(Icons.send, "Send Money"),
                _buildTransactionIcon(Icons.receipt, "Transfer Bill"),
                _buildTransactionIcon(Icons.phone_android, "Support"),
                _buildTransactionIcon(Icons.credit_card, "Credit Card"),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomAppBar(
          color: Colors.blue,

          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.home)),
                IconButton(onPressed: () {}, icon: Icon(Icons.qr_code)),
                IconButton(onPressed: () {}, icon: Icon(Icons.attach_money)),
                IconButton(onPressed: () {}, icon: Icon(Icons.person)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _accountCard(String title, String balance, String action, Color color) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(14),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          balance,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
          child: Text(action),
        ),
      ],
    ),
  );
}

Widget _buildTransactionIcon(IconData icon, String label) {
  return Column(
    children: [
      CircleAvatar(
        backgroundColor: Colors.blue.shade100,
        child: Icon(icon, color: Colors.blue),
      ),
      SizedBox(height: 4),
      Text(label, textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
    ],
  );
}
