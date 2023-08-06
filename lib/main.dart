import 'package:flutter/material.dart';
import 'package:lightweight/customize/BigText.dart';
import 'package:lightweight/AppConstants.dart';
import 'package:lightweight/auth/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Updated constructor

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff6347)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Light Weight'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title})
      : super(key: key); // Updated constructor

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // added Container widget
        decoration: BoxDecoration(color: Colors.black),
        // change this to your desired color
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/logo1024x1024.png'),
              SizedBox(height: AppConstants.deviceHeigh(context)*0.05,),
              Container(width: double.infinity, child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text("Be your own Coach!",style: TextStyle(fontFamily: "ROYALMOSCOW",color: Colors.white, fontSize: 40,),textAlign: TextAlign.left,),
              )),
              Container(width: double.infinity, child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text("Enough workouts,",style: TextStyle(fontFamily: "ROYALMOSCOW",color: Colors.white, fontSize: 40,),textAlign: TextAlign.left,),
              )),
              Container(width: double.infinity, child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text("Just Do it!",style: TextStyle(fontFamily: "ROYALMOSCOW",color: Colors.white, fontSize: 40,),textAlign: TextAlign.left,),
              )),
              SizedBox(height: AppConstants.deviceHeigh(context)*0.05,),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: BigText(title: "Start", size: 32),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(AppConstants.deviceWidth(context) * 0.8, AppConstants.deviceHeigh(context) * 0.07, ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
