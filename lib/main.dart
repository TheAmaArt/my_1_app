import "package:flutter/material.dart";

void main() {
  runApp(const DemandApp());
}

class DemandApp extends StatelessWidget {
  const DemandApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DemandAppHome(
        title: 'Demand_App',
      ),
    );
  }
}

class DemandAppHome extends StatefulWidget {
  const DemandAppHome({super.key, required this.title});
  final String title;
  @override
  DemandAppHomeState createState() => DemandAppHomeState();
}

class DemandAppHomeState extends State<DemandAppHome> {
  @override
  Widget build(BuildContext context) {
    List<String> text = [
      "I Want Cuddle",
      "Hungry !",
      "I Feel Alone",
      "Angry",
      "Bored",
      "Smiley",
    ];
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Colors.pinkAccent, Colors.yellowAccent]),
          ),
        ),
        title: const Text(
          "Demand_App",
          selectionColor: Colors.black,
        ),
      ),
      body: Scaffold(
        backgroundColor: Colors.white,
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(
            text.length,
            (index) {
              // gib etwas drückbares zurück
              return GestureDetector(
                onTap: () {
                  print("Hi Amedeo");
                },
                child: Center(
                  child: Container(
                    alignment: Alignment.center,
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.purpleAccent,
                          Colors.yellowAccent,
                        ],
                      ),
                    ),
                    child: Text(
                      selectionColor: Colors.white,
                      text[index],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
