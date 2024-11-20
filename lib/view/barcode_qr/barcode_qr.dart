import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class BarcodeQrScanner extends StatefulWidget {
  @override
  _BarcodeQrScannerState createState() => _BarcodeQrScannerState();
}

class _BarcodeQrScannerState extends State<BarcodeQrScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String? scanResult;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  @override
  void initState() {
    super.initState();
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        scanResult = scanData.code; // Capture the scanned result
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _launchURL() async {
    if (scanResult != null) {
      final Uri url = Uri.parse('https://www.google.com/search?q=$scanResult');
      try {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } catch (e) {
        print('Could not launch $url: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR/Barcode Scanner')),
      body: Stack(
        children: <Widget>[
          QRView(
            key: qrKey,
            onQRViewCreated: onQRViewCreated,
          ),
          if (scanResult != null)
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0), // Change to 10.0 for 10px
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Scan Result: $scanResult'),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _launchURL,
                        child: Text('Find More on Google'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}