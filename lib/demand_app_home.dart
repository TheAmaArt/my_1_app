
import 'package:flutter/material.dart';
import 'package:my_1_app/widgets/emotion_action.dart';

class DemandAppHome extends StatefulWidget {
  const DemandAppHome({Key? key}) : super(key: key);
  @override
  DemandAppHomeState createState() => DemandAppHomeState();
}

class DemandAppHomeState extends State<DemandAppHome> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<EmotionActions> text = [
      EmotionActions("/menu", "I Want to Cuddle"),
      EmotionActions("/login", "I am Hungry"),
      EmotionActions("/login", "Hallo"),
    ];
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Colors.pinkAccent, Colors.yellow],
            ),
          ),
        ),
        title: const Text(
          "Demand_App",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/menu');
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.yellow,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            label: "Play",
            icon: Icon(Icons.gamepad, color: Colors.black),
          ),
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
                0.1,
                0.4,
                0.6,
                0.9,
              ],
              colors: [
                Colors.yellowAccent,
                Colors.red,
                Colors.indigo,
                Colors.teal,
              ],
            ),
          ),
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(
              text.length,
              (index) {
                return GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          text[index].text,
                        ),
                      ),
                    );
                  },
                  child: Center(
                    child: Container(
                      alignment: Alignment.center,
                      height: 170,
                      width: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 30,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.pinkAccent,
                            Colors.deepPurpleAccent,
                          ],
                        ),
                      ),
                      child: Text(
                        text[index].text,
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
