import 'package:banking_app/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PreLogin extends StatelessWidget {
  const PreLogin({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> users = [
      {
        'name': 'Nishant Khadka',
        'email': 'nishant@gmail.com',
        'password': 'nishant',
      },
    ];
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(28, 22, 46, 1),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(
              // width: screenWidth,
              // child: Text('Create account'),
              // )
              const SizedBox(height: 80),
              Image(
                image: const AssetImage('assets/images/mobile-pay.png'),
                width: screenWidth,
              ),
              const SizedBox(height: 50),
              Text(
                'SET YOUR',
                style: GoogleFonts.inriaSans(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'FINANCIAL GOALS',
                style: GoogleFonts.inriaSans(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 45),
              Text(
                'Track you expenses and',
                style: GoogleFonts.inriaSans(
                  color: const Color.fromRGBO(168, 167, 170, 1),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'manage your finances easily.',
                style: GoogleFonts.inriaSans(
                  color: const Color.fromRGBO(168, 167, 170, 1),
                ),
              ),
              const SizedBox(height: 70),
              SizedBox(
                width: screenWidth * 0.39,
                child: FloatingActionButton(
                  backgroundColor: const Color.fromRGBO(33, 216, 161, 1),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(users: users),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ' Login  ',
                        style: GoogleFonts.inriaSans(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
