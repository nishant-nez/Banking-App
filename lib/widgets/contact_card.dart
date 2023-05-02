import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'launcher.dart';

class Contact extends StatefulWidget {
  // const Contact({super.key});
  final IconData icon;
  final String title;
  final String value;
  final String type;

  const Contact({super.key, required this.icon, required this.title, required this.value, required this.type});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked =
        await showDatePicker(context: context, initialDate: selectedDate, firstDate: DateTime(2015, 8), lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: () {
          if (widget.type != 'date') {
            launchURL(widget.value, widget.type);
          } else {
            _selectDate(context);
          }
        },
        child: Container(
          height: 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.withOpacity(0.2),
          ),
          width: screenWidth * 0.9,
          child: Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 20),
                    Icon(
                      widget.icon,
                      size: 35,
                    ),
                    const SizedBox(width: 20),
                    Column(
                      children: [
                        const SizedBox(height: 8),
                        Text(
                          widget.title,
                          style: GoogleFonts.inriaSans(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          widget.value,
                          style: GoogleFonts.inriaSans(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const Icon(Icons.arrow_right),
                // const SizedBox(width: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
