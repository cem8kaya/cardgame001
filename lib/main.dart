import 'package:flutter/material.dart';
import 'package:cardgame001/widget/flip_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MainPage(appTitle: 'Flutter Animation'),
    );
  }
}

class MainPage extends StatefulWidget {
  
  final String appTitle;

  const MainPage({this.appTitle});
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  bool flipped = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.appTitle),
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlipWidget(
            from: image('images/01pic.png'),
            to: image('images/01card.png'),
            animationStatus:
            flipped ? AnimationStatus.forward : AnimationStatus.reverse,
          ),
          // put some space
          SizedBox(height: 16.0),
          buildButton(context),
        ],
      )),

    );
  }

  OutlinedButton buildButton(BuildContext context) {

    final String buttonText = flipped ? 'Reverse flip' : 'Flip forward';

    return OutlinedButton(
      onPressed: () {
        setState(() {
          flipped = !flipped;
        });
      }, 
      child: Text(buttonText),
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          width: 2.0,
          color: Theme.of(context).primaryColor,
        )
      ),
    
    );
  }


  Widget image(String imagePath) => ClipRRect(
    borderRadius: BorderRadius.circular(8.0),
    child: Image.asset(
      imagePath,
      width: 300.0,
      height: 300.0,
      fit: BoxFit.cover,
    ),

  );

}