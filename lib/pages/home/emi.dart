import 'package:flutter/material.dart';
import 'dart:math';

import 'package:google_fonts/google_fonts.dart';

class EMICalculator extends StatefulWidget {
  const EMICalculator({super.key});

  @override
  EMICalculatorState createState() => EMICalculatorState();
}

class EMICalculatorState extends State<EMICalculator> {
  final _formkey = GlobalKey<FormState>();
  final List _tenureTypes = ['Month(s)', 'Year(s)'];
  String _tenureType = "Year(s)";
  String _emiResult = "";

  final TextEditingController _principalAmount = TextEditingController();
  final TextEditingController _interestRate = TextEditingController();
  final TextEditingController _tenure = TextEditingController();

  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Form(
        key: _formkey,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color.fromRGBO(156, 122, 255, 1),
                Color.fromRGBO(117, 97, 255, 1),
              ],
            ),
          ),
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 37),
                      child: Text(
                        'Loan EMI',
                        style: GoogleFonts.inriaSans(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 37),
                      child: Text(
                        'Calculator',
                        style: GoogleFonts.inriaSans(
                          fontSize: 29,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 90,
                        height: 7,
                        // color: Colors.purple,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    width: double.infinity,
                    height: screenHeight * 0.9,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        SizedBox(
                          width: screenWidth * 0.8,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: _principalAmount,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter Principle Amount";
                              }
                              return null;
                            },
                            style: GoogleFonts.inriaSans(
                              color: Colors.black,
                              fontSize: 17,
                            ),
                            decoration: InputDecoration(
                              labelText: 'Principle Amount',
                              labelStyle: const TextStyle(
                                color: Colors.black,
                              ),
                              filled: true,
                              fillColor: const Color.fromRGBO(245, 245, 245, 1),
                              contentPadding: const EdgeInsets.all(20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Color.fromRGBO(136, 104, 255, 1),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: screenWidth * 0.8,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: _interestRate,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter Interest Rate";
                              }
                              return null;
                            },
                            style: GoogleFonts.inriaSans(
                              color: Colors.black,
                              fontSize: 17,
                            ),
                            decoration: InputDecoration(
                              labelText: 'Interest Rate',
                              labelStyle: const TextStyle(
                                color: Colors.black,
                              ),
                              filled: true,
                              fillColor: const Color.fromRGBO(245, 245, 245, 1),
                              contentPadding: const EdgeInsets.all(20),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                  color: Color.fromRGBO(136, 104, 255, 1),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: screenWidth * 0.8,
                          // color: Colors.purple,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: screenWidth * 0.6,
                                child: TextFormField(
                                  textInputAction: TextInputAction.send,
                                  keyboardType: TextInputType.number,
                                  controller: _tenure,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter the Tenure";
                                    }
                                    return null;
                                  },
                                  style: GoogleFonts.inriaSans(
                                    color: Colors.black,
                                    fontSize: 17,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: 'Tenure',
                                    labelStyle: const TextStyle(
                                      color: Colors.black,
                                    ),
                                    filled: true,
                                    fillColor: const Color.fromRGBO(245, 245, 245, 1),
                                    contentPadding: const EdgeInsets.all(20),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color: Color.fromRGBO(136, 104, 255, 1),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    _tenureType,
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Switch(
                                    value: _switchValue,
                                    onChanged: (bool value) {
                                      // print(value);

                                      if (value) {
                                        _tenureType = _tenureTypes[1];
                                      } else {
                                        _tenureType = _tenureTypes[0];
                                      }

                                      setState(
                                        () {
                                          _switchValue = value;
                                        },
                                      );
                                    },
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 35),
                        SizedBox(
                          // decoration: BoxDecoration(
                          //   borderRadius: BorderRadius.circular(10),
                          // ),
                          width: screenWidth * 0.75,
                          height: 55,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromRGBO(115, 148, 243, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: _handleCalculation,
                            child: Text(
                              "Calculate your EMI",
                              style: GoogleFonts.inriaSans(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // color: Colors.redAccent,
                            // textColor: Colors.white,
                            // padding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 24.0, right: 24.0)
                          ),
                        ),
                        emiResultsWidget(_emiResult),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleCalculation() {
    if (_formkey.currentState!.validate()) {
      setState(() {
        double A = 0.0;
        int P = int.parse(_principalAmount.text);
        double r = int.parse(_interestRate.text) / 12 / 100;
        int n = _tenureType == "Year(s)" ? int.parse(_tenure.text) * 12 : int.parse(_tenure.text);

        A = (P * r * pow((1 + r), n) / (pow((1 + r), n) - 1));

        _emiResult = A.toStringAsFixed(2);
      });
    }
    //  Amortization
    //  A = Payemtn amount per period
    //  P = Initial Printical (loan amount)
    //  r = interest rate
    //  n = total number of payments or periods
  }

  Widget emiResultsWidget(emiResult) {
    bool canShow = false;
    String emiResult0 = emiResult;

    if (emiResult0.isNotEmpty) {
      canShow = true;
    }
    return Container(
      width: 290,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color.fromRGBO(156, 122, 255, 1),
            Color.fromRGBO(117, 97, 255, 1),
          ],
        ),
      ),
      // color: Colors.purple,
      margin: const EdgeInsets.only(top: 40.0),
      child: canShow
          ? Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text(
                    "रु $emiResult0",
                    style: GoogleFonts.inriaSans(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "EMI per month",
                    style: GoogleFonts.inriaSans(
                      fontSize: 18.0,
                      color: Colors.white,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          : Container(),
    );
  }
}
