import 'package:code_scanner/pages/create.dart';
import 'package:code_scanner/pages/scan.dart';
import 'package:flutter/material.dart';
class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR SCAN/GENERATE CODE'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: (MediaQuery.of(context).size.height)-
                  AppBar().preferredSize.height -
                  kToolbarHeight,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/scnner.jpg'),
                  foregroundColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  radius: 150,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Hero(
                      tag: "Scan QR",
                      child: Container(
                        width: ((MediaQuery.of(context).size.width)/2) - 45,
                        height: 50,
                        child: OutlineButton(
                          focusColor: Colors.red,
                          highlightColor: Colors.blue,
                          hoverColor: Colors.lightBlue[100],
                          splashColor: Colors.blue,
                          borderSide: BorderSide(width: 3,color: Colors.blue),
                          shape: StadiumBorder(),
                          child: Text("Scan QR",
                          style: TextStyle(fontSize: 17),
                          ),
                          onPressed: (){
                            Navigator.push(context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ScanQR()
                                ));
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),

                    Container(
                      width: ((MediaQuery.of(context).size.width)/2) - 45,
                      height: 50,
                      child: OutlineButton(
                        focusColor: Colors.red,
                        highlightColor: Colors.blue,
                        hoverColor: Colors.lightBlue[100],
                        splashColor: Colors.blue,
                        borderSide: BorderSide(width: 3,color: Colors.blue),
                        shape: StadiumBorder(),
                        child: Text("Create QR",
                          style: TextStyle(fontSize: 17),
                        ),
                        onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CreateQR()
                              ));
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
