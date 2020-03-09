import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';
import 'Response.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  List data;
  @override
  Widget build(BuildContext context) {
    //Now we need multiple widgets into a parent = "Container" widget
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(50.0),//Top, Right, Bottom, Left
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: new Text("ENSURING LINEMAN SAFETY USING  IoT AUTHENTICATION ",
                        style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0
                      ),textAlign: TextAlign.center,),
                ),
                //Need to add space below this Text ?
                new RaisedButton(
                  onPressed: () async {
                    print("testing 1");
                    String json = '{"phase": 1}';
                    final response = await http.post(
                        "https://idv55gwmae.execute-api.us-east-1.amazonaws.com/dev",
                        headers: {
                          "Accept": "application/json"
                        },
                      body: json
                    );
                    if(response.statusCode == 200){
                      print("----------inside 200----------------");
                    }
                    return "Success!";
                  },
                  child: new Text("Line 1"),
                  color:  Colors.lightBlueAccent,),
                new RaisedButton(
                  onPressed: () async {
                    print("testing 2");
                    String json = '{"phase": 2}';
                    var response = await http.post(
                        "https://idv55gwmae.execute-api.us-east-1.amazonaws.com/dev",
                        headers: {
                          "Accept": "application/json"
                        },
                        body: json
                    );
                  },
                  child: new Text("Line 2"),
                  color:  Colors.lightBlueAccent,)
              ],
            ),
          ),
        ],
      ),
    );


    Widget bottomSetcion=new Container(
      child:new Text('Developed By : Suresh A K',
      style: new TextStyle(
        color: Colors.redAccent,
        fontSize: 15,
      ),
        textAlign: TextAlign.center,
      ),

    );


    //build function returns a "Widget"
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "",
        home: new Scaffold(
            appBar: new AppBar(
              title: new Text('EB Safety Application'),
            ),
            body: new ListView(
              children: <Widget>[
                new Image.asset(
                    'images/tutorialChannel.png',
                    fit: BoxFit.cover
                ),
                //You can add more widget bellow
                titleSection,
                bottomSetcion,
              ],
            )
        )
    );//Widget with "Material design"
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: RaisedButton(
          onPressed: (){},
          child: Text("Phase 1"),
          color:  Colors.lightBlueAccent,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
