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
      home: const MyHomePage(title: 'Listes et Grilles tuto'),
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
    "Papier toilette",
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
      final widget = elementToShow(element);
      items.add(widget);
    });
    return items;
   }

   Widget elementToShow(String element) {
    return Padding(
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
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return elementToShow(courses[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
          itemCount: courses.length
      )

      // ListView.builder(
      //   itemCount: courses.length,
      //     itemBuilder: (BuildContext context, int index) {
      //       final element = courses[index];
      //       return elementToShow(element);
      //     }
      // ),
    );
  }
}
