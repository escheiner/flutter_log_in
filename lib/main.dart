import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new LoginPage(),
      theme: new ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final buggyColor = const Color(0xFFD99262);
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.easeIn,
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          backgroundColor: buggyColor,
          title: Text(
            "Login",
          ),
        ),
        body: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image(
                image: new AssetImage("assets/buggy.png"),
                fit: BoxFit.contain,
                height: _iconAnimation.value * 80,
                width: _iconAnimationController.value * 80,
              ),
              new Form(
                  child: new Theme(
                      data: new ThemeData(
                          inputDecorationTheme: new InputDecorationTheme(
                              labelStyle: new TextStyle(
                                  color: Colors.black54, fontSize: 15.0))),
                      child: new Container(
                        padding: const EdgeInsets.all(40.0),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new TextFormField(
                              decoration: new InputDecoration(
                                labelText: "Enter Email",
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            new TextFormField(
                              decoration: new InputDecoration(
                                labelText: "Enter Password",
                              ),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                            ),
                            new Padding(
                              padding: const EdgeInsets.only(top: 80.0),
                            ),
                            new RaisedButton(
                              color: buggyColor,
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                    new BorderRadius.circular(30.0)),
                              highlightColor: Colors.orange,
                              textColor: Colors.white,
                              child: new Text("LOGIN"),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => InstructionsPage()),
                                  );
                                }
                            )
                          ],
                        ),
                      )))
            ]));
  }
}
/*
class InstructionsPage extends StatelessWidget {
  final buggyColor = const Color(0xFFD99262);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scanning Instructions"),
        backgroundColor: buggyColor,
      ),
      body: Center(
        child: Text
          ("Please position the camera on the car's license plate."),
         ),
          new RaisedButton(
            color: buggyColor,
            textColor: Colors.white,
            shape: new RoundedRectangleBorder(
              borderRadius:new BorderRadius.circular(30.0)),
            child: Text('Take a Picture'),
            onPressed: () {//Todo Navigate back to camera for license scanner//
           },
        ),
       ],
      ),
     );
  }
}*/
