import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing/Assignment-02/assignment02.dart';
import 'package:testing/assignment01.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = Get.size;

    return
        Scaffold(
          body: SafeArea(
            child:  Padding(
              padding: const EdgeInsets.all(21.0),
              child: SizedBox(
                width: size.width,
                height: size.height,
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Text("Flutter Assignments", style: TextStyle(fontSize: size.width * .068, fontWeight: FontWeight.w900),),
                              SizedBox(height: size.height* 0.05,),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    minimumSize: Size(size.width*0.2, size.height*0.07),
                                    backgroundColor: Color(0xff141821),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(size.width*0.14)
                                    )
                                ),
                                onPressed: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Assignment01()),
                                  );

                                }, child: Text("Assignment - 01", style: TextStyle(fontWeight: FontWeight.w900, fontSize: size.width*.051, color: Colors.white),),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              // Text("Flutter Assignments", style: TextStyle(fontSize: size.width * .068, fontWeight: FontWeight.w900),),
                              SizedBox(height: size.height* 0.05,),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    minimumSize: Size(size.width*0.2, size.height*0.07),
                                    backgroundColor: Color(0xff141821),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(size.width*0.14)
                                    )
                                ),
                                onPressed: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Assignment02()),
                                  );

                                }, child: Text("Assignment - 02", style: TextStyle(fontWeight: FontWeight.w900, fontSize: size.width*.051, color: Colors.white),),
                              )
                            ],
                          )
                        ],
                      ),

                    ),

                    Text(
                      '  Sazidul Islam',
                      style: TextStyle(fontSize: size.width * 0.03, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ),
            ),

          ),
        )
    ;
  }
}
