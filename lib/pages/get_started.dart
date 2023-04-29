import 'package:banking_app/pages/login.dart';
import 'package:flutter/material.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: Colo,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 50,
              right: 15,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.values.single,
                children: const [
                  Text(
                    'welcome to\n',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  // SizedBox(height: 0),
                  // Container(height: 5, padding: EdgeInsets.zero,),
                  Text(
                    'Nishant\'s Bank\n',
                    style: TextStyle(
                      fontSize: 30,
                      // color: Color(0x1ad5ad),
                      color: Color.fromRGBO(26, 213, 173, 1),
                    ),
                  ),
                  // Container(height: 5, padding: EdgeInsets.zero,),
                  Text(
                    'Bank with confidence,\n    Anytime, Anywhere.',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(168, 167, 170, 1),
                    ),
                  ),
                  // Text('Anytime, Anywhere.\n'),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: screenWidth,
                height: screenHeight * 0.27,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(28, 22, 46, 1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: screenWidth * 0.34,
                    child: FloatingActionButton(
                      backgroundColor: const Color.fromRGBO(33, 216, 161, 1),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ),
                        );
                      },
                      child: const Text('Get Started'),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // right: 0.00001,
              left: 0.1,
              bottom: screenHeight * 0.184,
              child: Image(
                image: const AssetImage('assets/images/startup.png'),
                width: screenWidth * 1.25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
