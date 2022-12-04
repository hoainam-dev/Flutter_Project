import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BaiGiuaKy',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool isSwitched = false;
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if(image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }
  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if(image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }
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

    return Scaffold(
        appBar: AppBar(
          title:const Text('Setting', style: TextStyle(color: Colors.black,
                fontSize: 20.0, fontWeight: FontWeight.bold, ),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.black),
              onPressed: ( ){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyApp()),
                );
              },
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 16),
                  padding: EdgeInsets.only(left: 20, top: 20, right: 16),
                  width: 380,
                  height: 115,
                  // color: Colors.tealAccent[400],
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 0, 206, 165),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:<Widget> [
                      Stack(
                        children: [
                          Container(
                            width: 100,
                            height: 120,
                            margin:const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 2,  blurRadius: 10, color: Colors.black.withOpacity(0.1), offset: Offset(0,10)
                                  ),
                                ],
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage('https://s3-alpha-sig.figma.com/img/56b9/45d6/c1b8dbce96a460c809c636eb57d4dd30?Expires=1667779200&Signature=bNtZGmm2VFPNu6-8QWJGCmzm5OlfcuWx~YbYcy1ZvauiadH95hZ99046q2w4PK3acfAn52PQdBi~gLbd2nraeRdrDtE~8FwSjiTMId33uzmXoToxLj2-JfVjFAevubzqe692-tjEuoG2feOB5cdsdbv5eGNCNRRA4la2H26Y-dpvnPoJRXZKK4R9sBji665UVb0fJygwglVyf9JRwmfJu5hHNhjW7A9qcYVgYwOW74y9jjUULy6sZ5XVsyZDCJ6C9D2cBVL6bs2TeEv~ECzE~aFilF7eDlSUzrWonk9RZ2NqSFM-08WYBr1SFcQi6z3sJHqrhqfz-0ovKyUZtW10YQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA'),
                                ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 33,
                            child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 2,
                                color: Theme.of(context).scaffoldBackgroundColor
                              ),
                              color: Colors.greenAccent
                            ),
                            child: InkWell(
                              onTap: (){
                                pickImage;
                              },
                              child: Icon(Icons.camera_alt, color: Colors.white,),
                            )
                            ),
                          ),
                          Container(
                            margin:const EdgeInsets.only(left: 110, top: 25),
                            child: Column(
                              children: [
                                Expanded(
                                    child: Column(
                                      children: [
                                        Container(
                                            child: Text("YOO JIN", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),)
                                        ),
                                        Container(
                                          child: Text("Traveler", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                        )
                                      ],
                                    )
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin:const EdgeInsets.only(left: 230, top: 25),
                            child: Container(
                              width: 110,
                              height: 40,
                              child: Center(
                                child:
                                TextButton(
                                    onPressed: (){} ,
                                    child: Text("EDIT PROFILE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14))
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 0, 206, 165),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                                border: Border.all(
                                  width: 1.2,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  )
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      margin:const EdgeInsets.only(left: 50, top: 0, right: 20),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                color: Colors.black12,
                                width: 1.5,
                              )
                          )
                      ),
                      child: Row(
                        children: <Widget>[
                          Image.asset('images/Vector.png',),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: Text("Notifications", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),)
                          ),

                          Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                                print(isSwitched);
                              });
                            },
                            activeTrackColor: Color.fromARGB(255, 0, 206, 165),
                            activeColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      margin:const EdgeInsets.only(left: 50, top: 0, right: 20),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                color: Colors.black12,
                                width: 1.5,
                              )
                          )
                      ),
                      child: Row(
                        children: <Widget>[
                          Image.asset('images/Union.png', ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: Text("Languages", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),)
                          ),
                          IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_sharp),iconSize: 20, splashRadius: 30,
                              splashColor: Color.fromARGB(255, 0, 206, 165),
                              padding: EdgeInsets.fromLTRB(0, 0, 10, 0))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      margin:const EdgeInsets.only(left: 50, top: 10, right: 20),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                color: Colors.black12,
                                width: 1.5,
                              )
                          )
                      ),
                      child: Row(
                        children: <Widget>[
                          Image.asset('images/pay.png', ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: Text("Payment", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),)
                          ),
                          IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_sharp),iconSize: 20, splashRadius: 30,
                              splashColor: Color.fromARGB(255, 0, 206, 165),
                              padding: EdgeInsets.fromLTRB(0, 0, 10, 0))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      margin:const EdgeInsets.only(left: 50, top: 10, right: 20),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                color: Colors.black12,
                                width: 1.5,
                              )
                          )
                      ),
                      child: Row(
                        children: <Widget>[
                          Image.asset('images/Path.png', ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: Text("Privacy & Policies", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),)
                          ),
                          IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.arrow_forward_ios_sharp),
                              iconSize: 20,
                              splashRadius: 30,
                              splashColor: Color.fromARGB(255, 0, 206, 165),
                              padding: EdgeInsets.fromLTRB(0, 0, 10, 0)
                          )

                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      margin:const EdgeInsets.only(left: 50, top: 10, right: 20),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                color: Colors.black12,
                                width: 1.5,
                              )
                          )
                      ),
                      child: Row(
                        children: <Widget>[
                          Image.asset('images/letter.png', ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: Text("Feedback", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),)
                          ),
                          IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.arrow_forward_ios_sharp),
                            iconSize: 20,
                            splashRadius: 30,
                            splashColor: Color.fromARGB(255, 0, 206, 165),
                             padding: EdgeInsets.fromLTRB(0, 0, 10, 0)
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      margin:const EdgeInsets.only(left: 50, top: 10, right: 20),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                color: Colors.black12,
                                width: 1.5,
                              )
                          )
                      ),
                      child: Row(
                        children: <Widget>[
                          Image.asset('images/book.png', ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              child: Text("Usage", style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),)
                          ),
                          IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios_sharp),iconSize: 20,splashRadius: 30,
                              splashColor: Color.fromARGB(255, 0, 206, 165),
                              padding: EdgeInsets.fromLTRB(0, 0, 10, 0))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(30.0),
                child: Text("Sign out", style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal),),
              )
            ],
          ),
          ),
    );
  }
}
