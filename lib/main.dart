import 'package:entretien/showPage.dart';
import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import 'animal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Mini travail'),
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

  void goToMoveAnimal(title){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => showPage(title: title)),
    );
  }

  List<animal> animalList = [
    animal(imagePath: 'animals/bee.png', width: 150, height: 400, title: 'bee'),
    animal(imagePath: 'animals/cat.png', width: 150, height: 400, title: 'cat'),
    animal(imagePath: 'animals/cock.png', width: 150, height: 400, title: 'cock'),
    animal(imagePath: 'animals/dog.png', width: 150, height: 400, title: 'dog'),
    animal(imagePath: 'animals/monkey.png', width: 150, height: 400, title: 'monkey'),
    animal(imagePath: 'animals/rabbit.png', width: 150, height: 200, title: 'rabbit'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SizedBox(
          height: 400,
          child: ScrollSnapList(
            itemBuilder: _buildListItem,
            itemCount: animalList.length,
            itemSize: 200,
            onItemFocus: (index) {},
            dynamicItemSize: true,
          ),
        )
      )
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    animal caracter = animalList[index];
    return caracter;
  }
}


