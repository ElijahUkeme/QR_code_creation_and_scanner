import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:barcode_scan/barcode_scan.dart';

class ScanQR extends StatefulWidget {

  @override
  _ScanQRState createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {

  String result = "";
  Future scanQR() async{
    try{
      //String qrResult = await BarcodeScanner.scan();
      //var option = ScanOptions(autoEnableFlash: true);
      var qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult.rawContent.toString();

      });
    }on PlatformException catch(ex){
      if(ex.code == BarcodeScanner.cameraAccessDenied){
        setState(() {
          result = 'Camera permission was denied';
        });
      }else{
        setState(() {
          result = 'Unknown error $ex';
        });
      }
    }on FormatException{
      setState(() {
        result = 'You pressed the back button before scanning';
      });
    }catch(ex){
      setState(() {
        result = 'Unknown error $ex';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: Text(result,
        style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.normal),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.camera_alt),
        label: Text('Scan'),
        onPressed: scanQR,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

}
