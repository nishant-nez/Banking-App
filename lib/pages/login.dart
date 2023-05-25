import 'package:banking_app/pages/home_page.dart';
import 'package:banking_app/pages/signup.dart';
import 'package:banking_app/widgets/sql_helper.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:google_fonts/google_fonts.dart';

// String username = '';
List<Map<String, dynamic>> userlist = [];

class Login extends StatefulWidget {
  // const Login({super.key});
  final List<Map<String, String>> users;

  const Login({super.key, required this.users});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  // String? _password;
  bool _isSelected = false;
  int found = 0;

  // SQL PART
  bool _isloading = true;

  // void _getUser(String email) async {
  //   final data = await SQLHelper.getEmail(email);
  //   setState(() {
  //     userlist = data;
  //     // sleep(const Duration(milliseconds: 500));
  //     _isloading = false;
  //     // print('VALUE FROM SQL EMAIL SEARCH----------------');
  //     // print('entered email: $email');
  //     // print(userlist.length);
  //     // print(userlist);
  //     // print(userlist[0]['name']);
  //   });
  // }

  void _getUser(String email) {
    SQLHelper.getEmail(email).then((data) {
      setState(() {
        userlist = data;
        // sleep(const Duration(milliseconds: 500));
        _isloading = false;
        // print('VALUE FROM SQL EMAIL SEARCH----------------');
        // print('entered email: $email');
        // print(userlist.length);
        // print(userlist);
        // print(userlist[0]['name']);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
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
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUp(users: widget.users)),
              );
            },
            child: Text(
              'Sign Up',
              style: GoogleFonts.inriaSans(
                color: const Color.fromRGBO(255, 133, 149, 1),
                fontSize: 17,
                decoration: TextDecoration.underline,
                decorationThickness: 1.5,
              ),
            ),
          )
        ],
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
                      setState(() {});
                      // sleep(const Duration(milliseconds: 500));
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      } else if (!EmailValidator.validate(value)) {
                        return 'Please enter a valid email address';
                      } else if (userlist.length == 0) {
                        return 'No such email found!';
                      }
                      return null;
                    },
                    controller: _email,
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
                      setState(() {});
                      // sleep(const Duration(milliseconds: 500));
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      } else if (userlist.length != 0 && userlist[0]['password'] != _password.text) {
                        return 'Incorrect password!';
                      }
                      return null;
                    },
                    controller: _password,
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
                        color: const Color.fromRGBO(36, 205, 216, 1),
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
                        color: const Color.fromRGBO(210, 208, 213, 1),
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
                      _getUser(_email.text);
                      setState(() {});
                      // print("Email entered: ${_email.text}");
                      if (_formKey.currentState?.validate() ?? false) {
                        setState(() {});
                        if (userlist[0]['name'] != null) {
                          // var name = user['name']!.split(" ")[0];
                          // var name = userlist[0]['name'];
                          _formKey.currentState?.save();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeNav(namee: userlist[0]['name']),
                            ),
                          );

                          final snackBar = SnackBar(
                            content: const Text('Login Successful!'),
                            action: SnackBarAction(
                              label: 'OK',
                              onPressed: () {
                                // Some code to undo the change.
                              },
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          final snackBar = SnackBar(
                            content: const Text('Invalid email address'),
                            action: SnackBarAction(
                              label: 'OK',
                              onPressed: () {
                                // Some code to undo the change.
                              },
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      }

                      // SQL PART
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
