
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

  @override
  initState() {
    super.initState();
    maListeDeCourses = listeDeCourses();
  }

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
    "Liquide lave linge",
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

  List<Course> maListeDeCourses = [];


  List<Course> listeDeCourses() {
    List<Course> c = [];
    courses.forEach((element) {
      c.add(Course(element));
    });
    return c;
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
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(widget.title, style: const TextStyle(color: Colors.white),),
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
                key: Key(maListeDeCourses[index].element),
                child: tile(index),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                  setState(() {
                    maListeDeCourses.removeAt(index);
                  });
              },
              background: Container(
                margin: EdgeInsets.only(right: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Spacer(),
                    Text("Swipe pour supprimer")
                  ],
                ),
                color: Colors.redAccent
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(color: Colors.deepOrangeAccent, thickness: 1,);
          },
          itemCount: maListeDeCourses.length
      )
    );
  }

  ListTile tile(int index) {
    return ListTile(
      title: Text(maListeDeCourses[index].element),
      leading: Text(index.toString()),
      trailing:
      IconButton(onPressed: () {
        setState(() {
          maListeDeCourses[index].update();
        });
      },
        icon: Icon((maListeDeCourses[index].bought)
            ? Icons.check_box
            : Icons.check_box_outline_blank
        ),
      ),
      onTap: () {

      },
    );
  }
}

class Course {
  String element;
  bool bought = false;

  Course(this.element);

  update() {
    bought = !bought;
  }
}
