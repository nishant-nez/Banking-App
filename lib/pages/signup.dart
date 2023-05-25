import 'package:banking_app/widgets/sql_helper.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';
// import '../widgets/globals.dart' as globals;

class SignUp extends StatefulWidget {
  // SignUp({super.key});
  final List<Map<String, String>> users;
  const SignUp({super.key, required this.users});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // SQL PART
  List<Map<String, dynamic>> _userslist = [];
  bool _isloading = true;

  void _refreshUsers() async {
    final data = await SQLHelper.getItems();
    setState(() {
      _userslist = data;
      _isloading = false;
      // print('users list:----------------------');
      // print(_userslist);
    });
  }

  final _formKey = GlobalKey<FormState>();

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();

  // SQL ADD
  Future<void> _addItem() async {
    await SQLHelper.createItem(_name.text, _email.text, _password.text);
    _refreshUsers();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.9,
        backgroundColor: const Color.fromRGBO(28, 22, 46, 1),
        title: Text(
          'SignUp',
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
                  child: TextFormField(
                    style: GoogleFonts.inriaSans(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Name',
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
                        return 'Name is required';
                      }
                      return null;
                    },
                    controller: _name,
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
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      } else if (_password.text != _confirmPassword.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    controller: _password,
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
                      labelText: 'Confirm Password',
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
                      } else if (_password.text != _confirmPassword.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    controller: _confirmPassword,
                  ),
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
                        setState(() {});

                        final snackBar = SnackBar(
                          content: const Text('User created successfully!'),
                          action: SnackBarAction(
                            label: 'OK',
                            onPressed: () {
                              // Some code to undo the change.
                            },
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);

                        _addItem();
                        _name.clear();
                        _email.clear();
                        _password.clear();
                        _confirmPassword.clear();
                      }

                      // SQLLL

                      _refreshUsers();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'SignUp',
                          style: GoogleFonts.inriaSans(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login(users: widget.users)),
                    ).then((_) => setState(() {}));
                  },
                  child: Text(
                    'Back to Login',
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
          ),
        ),
      ),
    );
  }
}
