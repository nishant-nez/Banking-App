import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QR extends StatefulWidget {
  const QR({super.key});

  @override
  State<QR> createState() => _QRState();
}

class _QRState extends State<QR> {
  late List<CameraDescription> cameras;
  late CameraController cameraController;

  @override
  void initState() {
    startCamera();
    super.initState();
  }

  void startCamera() async {
    cameras = await availableCameras();
    cameraController = CameraController(
      cameras[0],
      ResolutionPreset.high,
      enableAudio: false,
    );
    await cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    // if (cameraController == null) {

    // }

    if (cameraController.value.isInitialized) {
      return SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                height: screenHeight * 0.34,
                width: screenWidth,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color.fromRGBO(156, 122, 255, 1),
                      Color.fromRGBO(117, 97, 255, 1),
                    ],
                  ),
                ),
                // child: Text('Hello'),
              ),
            ),
            Positioned(
              top: screenHeight * 0.09,
              child: Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Text(
                  'Scan QR',
                  style: GoogleFonts.inriaSans(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Positioned(
              top: screenHeight * 0.15,
              left: screenWidth * 0.1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(35),
                  //   // color: Colors.black,
                  // ),
                  // color: Colors.black,
                  width: screenWidth * 0.78,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: screenWidth * 0.39,
                        color: Colors.white,
                        child: TextButton(
                          child: const Text('Scan'),
                          onPressed: () {
                            final snackBar = SnackBar(
                              content: const Text('Scaning..'),
                              action: SnackBarAction(
                                label: 'OK',
                                onPressed: () {
                                  // Some code to undo the change.
                                },
                              ),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          },
                        ),
                      ),
                      Container(
                        width: screenWidth * 0.39,
                        color: Colors.white,
                        child: TextButton(
                          child: const Text('Share'),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Share QR Code"),
                                  content: Image.asset('assets/images/myqr.png'),
                                  actions: [
                                    TextButton(
                                      child: const Text("Close"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              left: screenWidth * 0.19,
              child: Container(
                height: screenHeight * 0.52,
                child: CameraPreview(cameraController),
              ),
            )
          ],
        ),
      );
    } else if (cameraController == null) {
      return SizedBox();
    } else {
      return SizedBox();
    }
  }
}
