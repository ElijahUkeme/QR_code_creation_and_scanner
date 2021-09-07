import 'package:code_scanner/pages/generate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateQR extends StatefulWidget {

  @override
  _CreateQRState createState() => _CreateQRState();
}

TextEditingController myController = new TextEditingController();
class _CreateQRState extends State<CreateQR> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text('QR Generator'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextFormField(
                controller: myController,
                decoration: InputDecoration(
                  errorStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 15.0
                  ),
                  labelText: 'Enter the data to generate QR code',
                  hintStyle: TextStyle(color: Colors.grey,fontSize: 15.0),
                  prefixIcon: Icon(Icons.link),
                ),
                onEditingComplete: navigate,
              ),
            ),

            Container(
              width: ((MediaQuery.of(context).size.width)/2) - 45,
              height: 35,
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
                onPressed: navigate,
              ),
            ),
          ],
        ),
      ),
    );
  }
  void navigate(){
    Navigator.push(context, MaterialPageRoute(builder: (context)
    => GenerateQR(myController.text)));
  }
}
