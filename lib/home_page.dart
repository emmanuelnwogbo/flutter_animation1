import 'package:flutter/material.dart';
//import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> hoverAnimation;

  List<Product> products = [
    Product(
      color: const Color(0xff000000),
      path: 'assets/black.png',
    ),
    Product(
      color: const Color(0xfffcecd0),
      path: 'assets/cream.png',
    ),
    Product(
      color: const Color(0xffb6d7e4),
      path: 'assets/blue.png',
    ),
  ];

  List<String> words = [
    'This is Page One',
    'This is Page Two',
    'This is Page Three',
  ];

  int currentIndex = 0;

  //constants colors
  List<Color> colors = [
   const Color(0xff000000),
   const Color(0xfffcecd0),
   const Color(0xffb6d7e4)
  ];

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..repeat(
        reverse: true,
      );

    hoverAnimation =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0, 0.2))
            .animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff292929),
      body: SafeArea(child: Column(children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 700),
          child: Container(
            key: ValueKey<int>(currentIndex),
            child: Text(
            words[currentIndex],
            style: TextStyle(
              color: colors[currentIndex],
              fontSize: 15,
              fontWeight: FontWeight.bold
            )
          ),)
        ),
      const SizedBox(
        height: 30,
      ),
      const SizedBox(
        height: 30,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(products.length, (index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
              },
              child: CircleAvatar(
                backgroundColor: products[index].color,
              ),
            ),
          );
        }),
      ),      
      ],),)
    );
  }
}

class Product {
  final Color color;
  final String path;

  Product({required this.color, required this.path});
}