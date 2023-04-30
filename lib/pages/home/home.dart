import 'package:flutter/material.dart';
import 'package:banking_app/pages/login.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  // final String name;
  // const Home({super.key, required this.name});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Welcome, $username!',
                    style: GoogleFonts.inriaSans(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image(
                      image: AssetImage('assets/images/user.png'),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: screenHeight * 0.23,
              width: double.infinity,
              // color: Colors.yellow,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.05),
                  spreadRadius: 2,
                  blurRadius: 5,
                )
              ]),
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Balance',
                      style: GoogleFonts.inriaSans(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          'रु 67,000',
                          style: GoogleFonts.inriaSans(
                            fontSize: 29,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.27,
                        ),
                        Container(
                          height: 35,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromRGBO(27, 214, 172, 1),
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              '+4.24%',
                              style: GoogleFonts.inriaSans(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'SAVINGS ACCOUNT\nXXXX-XXXX-XXXX-XXXX',
                      style: GoogleFonts.inriaSans(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Your Cards',
              style: GoogleFonts.inriaSans(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Image(
                      image: const AssetImage('assets/images/visa-1.png'),
                      width: screenWidth * 0.85,
                    ),
                    const SizedBox(width: 15),
                    Image(
                      image: const AssetImage('assets/images/visa-2.png'),
                      width: screenWidth * 0.85,
                    ),
                    const SizedBox(width: 15),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: screenWidth * 0.85,
              child: Text(
                'Transactions',
                style: GoogleFonts.inriaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.withOpacity(0.18),
              ),
              width: screenWidth * 0.85,
              height: screenHeight * 0.08,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Bigmart',
                      style: GoogleFonts.inriaSans(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '- रु 3,500',
                      style: GoogleFonts.inriaSans(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 14),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.withOpacity(0.18),
              ),
              width: screenWidth * 0.85,
              height: screenHeight * 0.08,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Salary',
                      style: GoogleFonts.inriaSans(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '+ रु 9,700',
                      style: GoogleFonts.inriaSans(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 17),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.withOpacity(0.18),
              ),
              width: screenWidth * 0.85,
              height: screenHeight * 0.08,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recharge',
                      style: GoogleFonts.inriaSans(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '- रु 200',
                      style: GoogleFonts.inriaSans(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 17),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.withOpacity(0.18),
              ),
              width: screenWidth * 0.85,
              height: screenHeight * 0.08,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Transfer',
                      style: GoogleFonts.inriaSans(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '- रु 6,500',
                      style: GoogleFonts.inriaSans(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 17),
          ],
        ),
      ),
    );
  }
}
