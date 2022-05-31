import 'package:flutter/material.dart';
import 'package:json_api/models/api_model.dart';
import 'package:json_api/pages/user_list.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
//import 'package:qr_code_scanner/qr_scanner_overlay_shape.dart';

class Scanner extends StatefulWidget {
  const Scanner({Key? key}) : super(key: key);

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {
  bool flashOn = false;
  bool frontCamera = false;
  GlobalKey qrKey = GlobalKey();
  late QRViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          QRView(
            key: qrKey,
            onQRViewCreated: (QRViewController controller) {
              _controller = controller;
              controller.scannedDataStream.listen((event) {
                print(event);
                if (mounted) {
                  _controller.dispose();
                  Navigator.pop(context, event);
                  Navigator.push(
                      context,
                      //id yi userModel sayfasına gönderiyoruz orada id parametresi beklenmektedir.
                      MaterialPageRoute(
                          builder: ((context) => UserList(
                                userModel: UserModel(
                                    id: int.tryParse(event.code.toString())),
                              ))));
                }
              });
            },
            overlay: QrScannerOverlayShape(borderColor: Colors.white),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 60),
              child: const Text('Scnner',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ButtonBar(
              alignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                    icon: Icon(flashOn ? Icons.flash_on : Icons.flash_off),
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        flashOn = !flashOn;
                      });
                      _controller.toggleFlash();
                    }),
                IconButton(
                    icon: Icon(
                        frontCamera ? Icons.camera_front : Icons.camera_rear),
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        frontCamera = !frontCamera;
                      });
                      _controller.flipCamera();
                    }),
                IconButton(
                    icon: const Icon(Icons.close),
                    color: Colors.white,
                    onPressed: () => Navigator.pop(context)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
