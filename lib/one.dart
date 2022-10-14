import 'package:flutter/material.dart';
import 'package:talento/main.dart';

class One extends StatefulWidget {
  State<StatefulWidget> createState() {
    return OneState();
  }
}

class OneState extends State<One> {
  double v = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("One Page", style: TextStyle(fontSize: 30)),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed("home");
              },
              icon: Icon(Icons.home)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded))
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Slider(
                min: 0,
                max: 100,
                value: v,
                onChanged: (val) {
                  setState(() {
                    v = val;
                  });
                },
                inactiveColor: Colors.red[200],
                activeColor: Colors.red),
            ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                            height: 500, child: Center(child: Text("$v")));
                      });
                },
                child: Text("OK"))
          ],
        ),
      ),
    );
  }
}
