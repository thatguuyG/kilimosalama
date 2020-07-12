import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kilimosalama/src/root_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/local_auth.dart';
import 'authentication.dart';
import 'main/mainHome.dart';
import 'google_sign_in.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final Auth _auth = Auth();
  final LocalAuthentication auth = LocalAuthentication();

  Widget _submitButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RootPage(auth: new Auth())));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.blueAccent.withAlpha(100),
                  offset: Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            color: Colors.white),
        child: Text(
          'Log In',
          style: TextStyle(fontSize: 20, color: Colors.greenAccent[700]),
        ),
      ),
    );
  }

  Widget _googleButton() {
    return Container(
      child: OutlineButton(
        splashColor: Colors.white,
        onPressed: () {
           signInWithGoogle()
        // print(result)
         .whenComplete(() {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return  MainPage();
                },
              ),
            );
          });
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        highlightElevation: 0,
        borderSide: BorderSide(color: Colors.white),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                  image: CachedNetworkImageProvider('https://firebasestorage.googleapis.com/v0/b/kilimo-salama.appspot.com/o/images%2Fgoogle_logo.png?alt=media&token=8f1eccc3-bd7d-4251-a501-8e22dfd68073'),
                  height: 35.0),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Sign in with Google',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Widget _signUpButton() {
  //   return InkWell(
  //     onTap: () {
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => SignUpPage()));
  //     },
  //     child: Container(
  //       width: MediaQuery.of(context).size.width,
  //       padding: EdgeInsets.symmetric(vertical: 13),
  //       alignment: Alignment.center,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.all(Radius.circular(5)),
  //         border: Border.all(color: Colors.white, width: 2),
  //       ),
  //       child: Text(
  //         'Register now',
  //         style: TextStyle(fontSize: 20, color: Colors.white),
  //       ),
  //     ),
  //   );
  // }

  // Widget _label() {
  //   return Container(
  //       margin: EdgeInsets.only(top: 40, bottom: 20),
  //       child: Column(
  //         children: <Widget>[
  //           Text(
  //             'Quick login with Touch ID',
  //             style: TextStyle(color: Colors.white, fontSize: 17),
  //           ),
  //           SizedBox(
  //             height: 20,
  //           ),
  //           Icon(Icons.fingerprint, size: 90, color: Colors.white),
  //           SizedBox(
  //             height: 20,
  //           ),
  //           Text(
  //             'Touch ID',
  //             style: TextStyle(
  //               color: Colors.white,
  //               fontSize: 15,
  //               decoration: TextDecoration.underline,
  //             ),
  //           ),
  //         ],
  //       ));
  // }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'K',
          style: GoogleFonts.aBeeZee(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
          children: [
            TextSpan(
              text: 'ilimo',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'Salama',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ]),
    );
  }

  Widget _description() {
    return Column(
      children: <Widget>[
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Take charge of your farm.',
              style: GoogleFonts.aBeeZee(
                fontSize: 35,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            )),
        Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Get actionable Insights.',
              style: GoogleFonts.aBeeZee(
                fontSize: 35,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.greenAccent[700], Colors.greenAccent[200]])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _title(),
              SizedBox(
                height: 80,
              ),
              _description(),
              SizedBox(
                height: 80.0,
              ),
              _submitButton(),
              SizedBox(
                height: 20,
              ),
              _googleButton(),
              // _signUpButton(),
              SizedBox(
                height: 20,
              ),

              // Text('Can check biometrics: $_canCheckBiometrics\n'),
              //   RaisedButton(
              //     child: const Text('Check biometrics'),
              //     onPressed: _checkBiometrics,
              //   ),
              // Text('Available biometrics: $_availableBiometrics\n'),
              // RaisedButton(
              //   child: const Text('Get available biometrics'),
              //   onPressed: _getAvailableBiometrics,
              // ),
              // SizedBox(height: 150.0,)
            ],
          ),
        ),
      ),
    );
  }
}
