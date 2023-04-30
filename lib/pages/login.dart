import 'package:banking_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.9,
        backgroundColor: const Color.fromRGBO(28, 22, 46, 1),
        title: Text(
          'Login',
          style: GoogleFonts.inriaSans(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          width: screenWidth,
          color: const Color.fromRGBO(28, 22, 46, 1),
          child: Form(
            key: _formKey,
            child: Column(
              // textDirection: te,
              children: [
                const SizedBox(height: 50),
                SizedBox(
                  width: screenWidth * 0.8,
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(20),
                  // ),
                  child: TextFormField(
                    style: GoogleFonts.inriaSans(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: const TextStyle(color: Color.fromRGBO(90, 87, 103, 1)),
                      filled: true,
                      fillColor: const Color.fromRGBO(20, 15, 38, 1),
                      contentPadding: const EdgeInsets.all(20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      // border: InputBorder.none,
                      // contentPadding: EdgeInsets.symmetric(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      } else if (!EmailValidator.validate(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: screenWidth * 0.8,
                  child: TextFormField(
                    style: GoogleFonts.inriaSans(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: const TextStyle(color: Color.fromRGBO(90, 87, 103, 1)),
                      filled: true,
                      fillColor: const Color.fromRGBO(20, 15, 38, 1),
                      contentPadding: const EdgeInsets.all(20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 45),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.12),
                    child: Text(
                      // PUT INRIA SANS FONT HERE
                      'FORGOT PASSWORD?',
                      style: GoogleFonts.inriaSans(
                        color: Color.fromRGBO(36, 205, 216, 1),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    // RadioListTile(value: 1, groupValue: _isSelected ? 1 : null, onChanged: null),
                    Padding(
                      padding: EdgeInsets.only(
                        left: screenWidth * 0.08,
                      ),
                      child: Theme(
                        data: ThemeData(
                          unselectedWidgetColor: const Color.fromRGBO(210, 208, 213, 1),
                          checkboxTheme: CheckboxThemeData(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        child: Checkbox(
                          value: _isSelected,
                          onChanged: (bool? value) {
                            setState(() {
                              _isSelected = value!;
                            });
                          },
                        ),
                      ),
                    ),
                    Text(
                      // INRIA SANS BOLD
                      'Remember me',
                      style: GoogleFonts.inriaSans(
                        color: Color.fromRGBO(210, 208, 213, 1),
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: screenWidth * 0.39,
                  height: screenHeight * 0.08,
                  child: FloatingActionButton(
                    backgroundColor: const Color.fromRGBO(33, 216, 161, 1),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _formKey.currentState?.save();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ' Login  ',
                          style: GoogleFonts.inriaSans(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
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
      ),
    );
  }
}
