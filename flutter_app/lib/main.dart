import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';
import 'Response.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Now we need multiple widgets into a parent = "Container" widget
    Widget titleSection = Builder(
        builder: (context) => new Container(
          padding: const EdgeInsets.all(50.0), //Top, Right, Bottom, Left
          child: new Row(
            children: <Widget>[
              new Expanded(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: new Text(
                        "ENSURING LINEMAN SAFETY USING  IoT AUTHENTICATION ",
                        style: new TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    //Need to add space below this Text ?
                    new RaisedButton(
                      onPressed: () async {
                        print("testing 1");
                        String json = '{"phase": 1}';
                        final response = await http.post(
                            "https://idv55gwmae.execute-api.us-east-1.amazonaws.com/dev",
                            headers: {"Accept": "application/json"},
                            body: json);
                        if (response.statusCode == 200) {
                          Toast.show("success", context,duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                          print("----------inside 200----------------");
                        }
                        return "Success!";
                      },
                      child: new Text("Line 1"),
                      color: Colors.lightBlueAccent,
                    ),
                    new RaisedButton(
                      onPressed: () async {
                        print("testing 2");
                        String json = '{"phase": 2}';
                        var response = await http.post(
                            "https://idv55gwmae.execute-api.us-east-1.amazonaws.com/dev",
                            headers: {"Accept": "application/json"},
                            body: json);
                        if (response.statusCode == 200)
                          Toast.show("success", context,duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                      },
                      child: new Text("Line 2"),
                      color: Colors.lightBlueAccent,
                    )
                  ],
                ),
              ),
            ],
          ),
        ));

    Widget bottomSetcion = new Container(
      child: new Text(
        'Developed By : Sudeep P Suseelan',
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
                new Image.asset('images/tutorialChannel.png',
                    fit: BoxFit.cover),
                //You can add more widget bellow
                titleSection,
                bottomSetcion,
              ],
            ))); //Widget with "Material design"
  }
}
