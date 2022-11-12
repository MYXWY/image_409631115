import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ImageBrowse(title: 'Wonyoung_with_409631115'),
    );
  }
}

class ImageBrowse extends StatefulWidget {
  const ImageBrowse({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<ImageBrowse> createState() => _ImageBrowseState();
}

class _ImageBrowseState extends State<ImageBrowse> {
  var images=['assets/assets1.jpg','assets/assets2.jpeg','assets/assets3.jpg','assets/assets4.jpg'];
  int imageindex=1;
  String defult_image="assets/assets1.jpg";

  void previous (){
    if(imageindex<=0){imageindex=4;}
    defult_image = images[imageindex-1];
    imageindex--;
  }
  void next (){
    if(imageindex>=3){imageindex=-1;}
    defult_image = images[imageindex+1];
    imageindex++;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap:(){
                const snackBar = SnackBar(
                  content: Text('                        老員寶簽到!!!',
                    textScaleFactor: 1.4,
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Container(
                height: 300,
                width: 400,
                child: Image.asset(defult_image),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: (){
                        setState(() {
                          previous();
                        });
                      },
                      child: Text("上一張",
                        textScaleFactor:1.5,)
                  ),
                  SizedBox(width: 50,),
                  ElevatedButton(
                    onPressed: (){
                      setState(() {
                        next();
                      });
                    },
                    child: Text("下一張",
                      textScaleFactor:1.5,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}