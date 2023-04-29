import 'package:banking_app/pages/login.dart';
import 'package:flutter/material.dart';

class PreLogin extends StatelessWidget {
  const PreLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(28, 22, 46, 1),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            // width: screenWidth,
            // child: Text('Create account'),
            // )
            Image(
              image: const AssetImage('assets/images/mobile-pay.png'),
              width: screenWidth,
            ),
            const SizedBox(height: 50),
            const Text(
              'SET YOUR',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'FINANCIAL GOALS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 45),
            const Text(
              'Track you expenses and',
              style: TextStyle(
                color: Color.fromRGBO(168, 167, 170, 1),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'manage your finances easily.',
              style: TextStyle(
                color: Color.fromRGBO(168, 167, 170, 1),
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
                      builder: (context) => Login(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Login  '),
                    Icon(Icons.keyboard_arrow_right),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
