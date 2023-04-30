import 'package:banking_app/pages/pre_login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              right: 22,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                // crossAxisAlignment: CrossAxisAlignment.values.single,
                children: [
                  Text(
                    'welcome to\n',
                    style: GoogleFonts.inriaSans(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // SizedBox(height: 0),
                  // Container(height: 5, padding: EdgeInsets.zero,),
                  Text(
                    'Nishant\'s Bank\n',
                    style: GoogleFonts.dosis(
                      fontSize: 30,
                      // color: Color(0x1ad5ad),
                      color: const Color.fromRGBO(26, 213, 173, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Container(height: 5, padding: EdgeInsets.zero,),
                  Text(
                    'Bank with confidence,\n     anytime, anywhere.',
                    style: GoogleFonts.inriaSans(
                      fontSize: 15,
                      color: const Color.fromRGBO(168, 167, 170, 1),
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
                            builder: (context) => PreLogin(),
                          ),
                        );
                      },
                      child: Text(
                        'Get Started',
                        style: GoogleFonts.inriaSans(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
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
