import 'package:entretien/showPage.dart';
import 'package:flutter/material.dart';

class animal extends StatelessWidget {
  final imagePath;
  final height;
  final width;
  final title;
  const animal({Key? key, this.imagePath, this.width, this.height, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 500,
      child: Card(
        elevation: 5,
        child: Column(
          children: [
            Container(
              height: 300,
              child: Center(
                  child: Image(
                    image: AssetImage(imagePath),
                    width: width,
                    height: height,
                  )
              ),
            ),
            GestureDetector(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.deepPurple.withOpacity(0.8),
                    child: Text('Choose $title', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => showPage(title: title)),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
