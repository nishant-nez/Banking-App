import 'package:banking_app/pages/home/emi.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'home/home.dart';
import 'home/more.dart';
import 'home/qr.dart';

class HomeNav extends StatefulWidget {
  // const HomeNav({super.key});
  late String namee;
  HomeNav({super.key, required this.namee});

  String get userName => namee;

  @override
  State<HomeNav> createState() => _HomeNavState();
}

class _HomeNavState extends State<HomeNav> {
  // get
  // final userName = widget.name;
  final List<Widget> _pages = [
    Home(),
    // Payments(),
    QR(),
    EMICalculator(),
    More(),
  ];
  int currentindex = 0;
  // void _onItemTapped(int index) {
  //   setState(() {
  //     currentindex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _pages[currentindex],
      bottomNavigationBar: Container(
        width: screenWidth,
        // color: Colors.white,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(17),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
          child: GNav(
            onTabChange: (index) {
              setState(() {
                // print(widget.name);
                currentindex = index;
              });
            },
            backgroundColor: const Color.fromRGBO(254, 254, 254, 1),
            activeColor: Colors.white,
            tabBackgroundColor: const Color.fromRGBO(136, 104, 255, 1),
            gap: 8,
            padding: const EdgeInsets.all(16),
            hoverColor: Colors.black,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              // GButton(
              //   icon: Icons.receipt,
              //   text: 'Payments',
              // ),
              GButton(
                icon: Icons.qr_code,
                text: 'QR',
              ),
              GButton(
                icon: Icons.calculate,
                text: 'EMI Calculator',
              ),
              GButton(
                icon: Icons.more,
                text: 'More',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
