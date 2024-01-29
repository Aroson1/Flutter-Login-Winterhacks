import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_validator/form_validator.dart';

import '../../core/utils/image_constant.dart';

class LoginUI extends StatefulWidget {
  const LoginUI({super.key});

  @override
  State<LoginUI> createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  /// A form key used to identify and manage the state of the login form.
  GlobalKey<FormState> _form = GlobalKey<FormState>();

  /// A boolean variable to keep track of whether the "Remember Me" checkbox is checked or not.
  bool rememberMe = false;

  /// A controller for the password input field.
  final _passwordController = TextEditingController();

  /// A controller for the username input field.
  final _usernameController = TextEditingController();

  /// A string variable to store the heading of the form
  String _headingText = "Welcome Back!";

  /// Callback function to handle the change in the "Remember Me" checkbox.
  void _onRememberMeChanged(bool? newValue) => setState(() {
        rememberMe = newValue!;
      });

  /// Callback function to handle the press event of the login button.
  void _onLoginButtonPressed() {
    _validate();
    print("SIGN_IN_BUTTON");
  }

  /// Callback function to handle the press event of the sign-up button.
  void _onSignUpButtonPressed() {
    // Navigate to the sign-up page
    Navigator.pushNamed(context, '/signup');
  }

  /// Function to validate the form.
  void _validate() {
    _form.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 30,
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              // Display the welcome message
              Text(
                _headingText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Form(
                key: _form,
                child: Column(
                  children: [
                    // Username input field
                    TextFormField(
                      controller: _usernameController,
                      validator: ValidationBuilder()
                          .minLength(3)
                          .maxLength(50)
                          .build(),
                      onEditingComplete: _validate,
                      decoration: InputDecoration(
                        hintText: 'Username',
                        prefixIcon: Icon(Icons.person_outline),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Password input field
                    TextFormField(
                      controller: _passwordController,
                      validator: ValidationBuilder()
                          .minLength(3)
                          .maxLength(50)
                          .build(),
                      onEditingComplete: _validate,
                      obscureText: true,
                      obscuringCharacter: '●',
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock_outline),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Display the remember me checkbox and forgot password link
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: rememberMe,
                        onChanged: _onRememberMeChanged,
                      ),
                      Text('Remember me'),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _headingText = "Skill Issue :(";
                      });
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              // Login button
              InkWell(
                onTap: _onLoginButtonPressed,
                child: Container(
                  width: 314,
                  height: 50,
                  child: Stack(
                    children: [
                      // Button background
                      Container(
                        width: 314,
                        height: 50,
                        decoration: ShapeDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(1.00, -0.01),
                            end: Alignment(-1, 0.01),
                            colors: [Color(0xFF9C3FE4), Color(0xFFC65647)],
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      // Button text
                      Positioned(
                        left: 126,
                        top: 11,
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17.92,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              // Display a horizontal line with text "Or continue with" in the middle
              Row(
                children: [
                  // Left Divider line
                  Expanded(
                    child: Container(
                      height: 2,
                      margin: EdgeInsets.only(
                        right: 10,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(0, 255, 255, 255),
                            Colors.white,
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Text "Or continue with"
                  Text(
                    'Or continue with',
                    style: TextStyle(
                      color: Color(0xFFB5B5B5),
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  // Right Divider line
                  Expanded(
                    child: Container(
                      height: 2,
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.white,
                            Color.fromARGB(0, 255, 255, 255),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 20,
              ),
              /**
               * Additional Login Options
               */
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      // Google Login
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 58.10,
                          height: 44,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 58.10,
                                  height: 44,
                                  decoration: ShapeDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(ImageConstant.imgCard),
                                      fit: BoxFit.none,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 0.30, color: Colors.white),
                                      borderRadius: BorderRadius.circular(8.85),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 58.10,
                                  height: 44,
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 0.30, color: Colors.white),
                                      borderRadius: BorderRadius.circular(8.85),
                                    ),
                                  ),
                                  child: Container(
                                    decoration: ShapeDecoration(
                                      image: DecorationImage(
                                        image:
                                            AssetImage(ImageConstant.imgGoogle),
                                        fit: BoxFit.fitHeight,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 0.30, color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(8.85),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      // Facebook Login
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 58.10,
                          height: 44,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 58.10,
                                  height: 44,
                                  decoration: ShapeDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(ImageConstant.imgCard),
                                      fit: BoxFit.none,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 0.30, color: Colors.white),
                                      borderRadius: BorderRadius.circular(8.85),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                    width: 58.10,
                                    height: 44,
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 0.30, color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(8.85),
                                      ),
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        ImageConstant.imgFacebook,
                                        color: Colors.blue,
                                        width: 30,
                                        height: 30,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 2,
                    height: 44,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(0, 255, 255, 255),
                          Colors.white,
                        ],
                      ),
                    ),
                  ),
                  // Sign Up Button
                  InkWell(
                    onTap: _onSignUpButtonPressed,
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 15,
                        bottom: 15,
                      ),
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(1.00, -0.01),
                          end: Alignment(-1, 0.01),
                          colors: [Color(0xFF9C3FE4), Color(0xFFC65647)],
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text(
                        ' Sign Up Instead ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
