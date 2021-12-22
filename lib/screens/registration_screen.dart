import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vezeeta_flutter/constants.dart';
import 'package:provider/provider.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:vezeeta_flutter/screens/doctorProfile_screen.dart';
import 'package:vezeeta_flutter/screens/home_screen.dart';
import 'package:vezeeta_flutter/screens/reservation_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  GlobalKey<FormState> textKey = GlobalKey<FormState>();
  void validate() {
    if (textKey.currentState!.validate()) {
      print('Validated');
    } else {
      print('Not Validate');
    }
  }

  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: kDefaultPadding / 2,
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 50.0),
                    decoration: BoxDecoration(
                      color: Color(0xff282E3C),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(180),
                        topRight: Radius.circular(180),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Positioned(
                          bottom: 50,
                          child: Hero(
                            tag: 'logo',
                            child: Container(
                              height: 100.0,
                              child: Image.network(
                                  'https://d1aovdz1i2nnak.cloudfront.net/vezeeta-web-reactjs/36476/_next/static/images/whitelogowithdotcom.png'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 48.0,
                        ),
                        Form(
                          key: textKey,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              email = value;
                            },
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              suffixIcon: Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                              labelText: 'Email',
                              errorStyle: TextStyle(
                                color: Colors.red[700],
                              ),
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1.5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1.5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                            ),
                            validator: MultiValidator([
                              RequiredValidator(errorText: "Required"),
                              EmailValidator(errorText: "Not A Valid Email"),
                            ]),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          obscureText: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                          onChanged: (value) {
                            password = value;
                          },
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.vpn_key_rounded,
                              color: Colors.white,
                            ),
                            labelText: 'Password',
                            errorStyle: TextStyle(
                              color: Colors.red[700],
                            ),
                            labelStyle: TextStyle(
                              color: Colors.white,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                          ),
                          validator: MinLengthValidator(6,
                              errorText: "Should Be at least 6 items"),
                        ),
                        SizedBox(
                          height: 24.0,
                        ),
                        InkWell(
                          onTap: () async {
                            // try {
                            //   final newUser =
                            //       await _auth.createUserWithEmailAndPassword(
                            //           email: email, password: password);
                            //   if (newUser != null) {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //         builder: (context) => HomeScreen(),
                            //       ),
                            //     );
                            //   }
                            // } catch (e) {
                            //   print(e);
                            // }
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                            validate;
                          },
                          child: Container(
                            height: 50,
                            child: Center(
                              child: Text(
                                'Register',
                                style: GoogleFonts.almarai(
                                  textStyle: textCard,
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xff4E60FF),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Color(0xff282E3C)
// Color(0xff4E60FF)