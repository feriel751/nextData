import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/auth/Screens/Controllers/authController.dart';
class SignUpPage extends StatefulWidget{
  const SignUpPage({super.key});
  @override
  _signupPageState createState() => _signupPageState();
}
class _signupPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isPressed = false;
  bool _isPressedLogin = false;
   var authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {

    return  GetBuilder<AuthController>(builder: (_) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: PageView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          children:[
            Padding(
              padding : EdgeInsets.only(top :100 ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:[
                    SizedBox(
                      child:SvgPicture.asset(
                        'assets/images/nextdata-logo.svg',
                        width: 178.64,
                        height: 90,
                      ),
                    ),
                    SizedBox(height : 40),
                    // 2 text
                    Text(
                      'Welcome to NextData',
                      style: TextStyle(
                        fontWeight:FontWeight.bold,
                        color: Colors.black,
                        fontSize: 22,
                        fontFamily: "Poppins-Bold",
                      ),
                    ),
                    SizedBox(height : 20),
                    Text(
                      'Create an account to get started ',
                      style: TextStyle(
                        color: Color(0xFF737791),
                        fontSize: 13,
                        fontFamily: "Poppins-Thin",
                      ),
                    ),


                    SizedBox(height : 20),
                    Column(
                      children: [
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              const Padding(
                                  padding: EdgeInsets.only(left : 8.0),
                                  child: Text("Name",
                                      style: TextStyle(
                                        color: Color(0xFF233453),
                                        fontSize: 14,
                                        fontFamily: "Poppins-Light",
                                        fontWeight: FontWeight.w400,
                                      ))),
                              Container(
                                height: 42,
                                width: 328,
                                child: TextFormField(
                                  controller:_.nameController,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    hintText: "Name",
                                    hintStyle: const TextStyle(
                                      color: Color(0xFF737791),
                                      fontFamily: "Poppins-Thin",
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),

                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: const Color(0xffC3D3E2)
                                              .withOpacity(0.3),
                                          width: 2,
                                        )),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: const Color(0xffC3D3E2)
                                              .withOpacity(0.3),
                                          width: 2,
                                        )),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height:15,
                              ),
                              const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("Email Address",
                                      style: TextStyle(
                                        color: Color(0xFF233453),
                                        fontSize: 14,
                                        fontFamily: "Poppins-Light",
                                        fontWeight: FontWeight.w400,
                                      )

                                  )
                              ),
                              Container(
                                height: 42,
                                width: 328,
                                child: TextFormField(

                                  controller: _.emailController,
                                 // obscureText: true,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    hintText: "email@email.com",
                                    hintStyle: const TextStyle(
                                        color: Color(0xFF737791),
                                        fontFamily: "Poppins-Thin",
                                        fontSize: 12),


                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: const Color(0xffC3D3E2)
                                              .withOpacity(0.3),
                                          width: 2,
                                        )),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: const Color(0xffC3D3E2)
                                              .withOpacity(0.3),
                                          width: 2,
                                        )),
                                  ),
                                ),
                              ),



                              const SizedBox(
                                height:15,
                              ),
                              const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text("Password",
                                      style: TextStyle(
                                        color: Color(0xFF233453),
                                        fontSize: 14,
                                        fontFamily: "Poppins-Light",
                                        fontWeight: FontWeight.w400,
                                      )

                                  )
                              ),
                              Container(
                                height: 42,
                                width: 328,
                                child: TextFormField(
                                  controller: _.passwordController,
                                  obscureText: true,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    hintText: "Create a password",
                                    hintStyle: const TextStyle(
                                        color: Color(0xFF737791),
                                        fontFamily: "Poppins-Thin",
                                        fontSize: 12),
                                    suffixIcon:  Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: const Icon(Icons.visibility,
                                          color: Color(0xFF737791)),
                                    ),

                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: const Color(0xffC3D3E2)
                                              .withOpacity(0.3),
                                          width: 2,
                                        )),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: const Color(0xffC3D3E2)
                                              .withOpacity(0.3),
                                          width: 2,
                                        )),
                                  ),
                                ),
                              ),


                              const SizedBox(
                                height:15,
                              ),

                              Container(
                                height: 42,
                                width: 328,
                                child: TextFormField(
                                  //controller: ,
                                  obscureText: true,
                                  cursorColor: Colors.black,
                                  decoration: InputDecoration(
                                    hintText: "Confirm password",
                                    hintStyle: const TextStyle(
                                        color: Color(0xFF737791),
                                        fontFamily: "Poppins-Thin",
                                        fontSize: 12),
                                    suffixIcon:  Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: const Icon(Icons.visibility,
                                          color: Color(0xFF737791)),
                                    ),

                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: const Color(0xffC3D3E2)
                                              .withOpacity(0.3),
                                          width: 2,
                                        )),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                          color: const Color(0xffC3D3E2)
                                              .withOpacity(0.3),
                                          width: 2,
                                        )),
                                  ),
                                ),
                              ),

                            ],
                          ),






                        ),

                      ],



                    ),




                    SizedBox(height : 20),
                    /// the two button
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [




                        GestureDetector(
                          onTap: () async {
                            setState(() {
                              _isPressed = !_isPressed;
                            });
                            await _.signUpWithEmailAndPassword();
                          },
                          child: Container(
                            height:48,
                            width: 328,
                            decoration: BoxDecoration(
                              color: _isPressed ? Colors.white : const Color(0xFF1864D3),
                              borderRadius: BorderRadius.circular(10.0),
                              border: _isPressed
                                  ? Border.all(color: const Color(0xFF1864D3), width: 1)
                                  : null,
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: ()  async {

await _.signUpWithEmailAndPassword();

                                },
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: _isPressed ? const Color(0xFF1864D3) : Colors.white,
                                    fontSize:14,
                                    fontFamily: 'Poppins-Light',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),


                      ],




                    ),




                  ],
                ),









              ),
            ),



          ]),
    );});
  }
}
