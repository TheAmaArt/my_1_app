import 'package:flutter/material.dart';
import 'package:my_1_app/log_in_screen.dart';

void main() {
  runApp(const DemandApp());
}
class DemandApp extends StatelessWidget {
  const DemandApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demand_App',
      initialRoute: '/home',
      routes: {
        '/home': (context) => const DemandAppHome(),
        '/login': (context) => LogInPage(),
      },
    );
  }
}
class DemandAppHome extends StatefulWidget {
  const DemandAppHome({Key? key}) : super(key: key);
  @override
  DemandAppHomeState createState() => DemandAppHomeState();
}
class DemandAppHomeState extends State<DemandAppHome> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<String> text = [
      "I Want to Cuddle",
      "Hungry !",
      "I Feel Alone",
      "Angry",
      "Bored",
      "Smiley",
      "Hallo",
      "Hallo",
      "Hallo",
      "Hallo",
    ];
    return Scaffold(
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
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
        ),
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
                Colors.yellow,
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
                    print("Hi Amedeo");
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
                            Colors.white,
                          ],
                        ),
                      ),
                      child: Text(
                        text[index],
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