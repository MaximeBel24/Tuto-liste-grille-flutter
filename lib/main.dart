import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Listes et grilles tuto'),
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

  List<String> courses = [
    "Carottes",
    "Tomates",
    "Cerises",
    "Mangue",
    "Produit Vaiselle",
    "Soda",
    "Nutella",
    "Viande",
    "Poisson",
    "Papier toilette"
    "liquide lave linge",
    "chlore",
    "Sauce salade",
    "Huile d'olive",
    "Dentifrice",
    "Brosse à dents",
    "Pain",
    "Fraise",
    "Shampoing",
    "Monster Energy",
    "Noix de coco en poudre"
  ];

  List<Widget> itemCourses() {
    List<Widget> items = [];
    courses.forEach((element) {
      final widget = Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(element),
            const Icon(Icons.check_box_outline_blank)
          ],
        ) ,
      );


      items.add(widget);
    });
    return items;
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: itemCourses(),
          ),
        ),
      ),
    );
  }
}
