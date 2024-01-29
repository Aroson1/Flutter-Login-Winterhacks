import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_validator/form_validator.dart';

import '../../core/utils/image_constant.dart';

class SignupUI extends StatefulWidget {
  const SignupUI({super.key});

  @override
  State<SignupUI> createState() => _SignupUIState();
}

class _SignupUIState extends State<SignupUI> {
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();

  void _onSignupButtonPressed() {
    print("SIGN_IN_BUTTON");
    _validate();
  }

  void _onLoginButtonPressed() {
    Navigator.pushNamed(context, '/login');
  }

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
              Text(
                'Join the Community!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Form(
                key: _form,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      onEditingComplete: _validate,
                      validator: ValidationBuilder()
                          .minLength(3)
                          .maxLength(50)
                          .build(),
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
                    TextFormField(
                      controller: _emailController,
                      // onTapAlwaysCalled: _validate,
                      onEditingComplete: _validate,
                      validator:
                          ValidationBuilder().email().maxLength(50).build(),
                      decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.person_outline),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      onEditingComplete: _validate,
                      validator: ValidationBuilder()
                          .minLength(8)
                          .maxLength(50)
                          .build(),
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
              InkWell(
                onTap: _onSignupButtonPressed,
                child: Container(
                  width: 314,
                  height: 50,
                  child: Stack(
                    children: [
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
                      Positioned(
                        left: 126,
                        top: 11,
                        child: Text(
                          'Sign Up',
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
              // continue with text
              Row(
                children: [
                  //add a horizontal line
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
                                    // image: DecorationImage(
                                    //   image: ImageIcon(image: AssetImage(ImageConstant.imgCard)).image,
                                    //   fit: BoxFit.none,
                                    // ),
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
                                      // image: DecorationImage(
                                      //   image: ImageIcon(image: AssetImage(ImageConstant.imgCard)).image,
                                      //   fit: BoxFit.none,
                                      // ),
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
                  InkWell(
                    onTap: _onLoginButtonPressed,
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
                        ' Login Instead ',
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
