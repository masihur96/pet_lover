import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pet_lover/login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'Register',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: _bodyUI(context),
        physics: ClampingScrollPhysics(),
      ),
    );
  }

  Widget _bodyUI(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      child: Column(
        children: [
          Container(
            width: size.width,
            height: size.height * .25,
            decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(size.width * .4),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.paw,
                          color: Colors.white, size: size.width * .06),
                      SizedBox(
                        width: size.width * .05,
                      ),
                      Text(
                        'Pet Lover',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width * .1,
                          fontFamily: 'MateSC',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: size.width * .05,
                      ),
                      Icon(FontAwesomeIcons.paw,
                          color: Colors.white, size: size.width * .06),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.width * .04,
                ),
                Container(
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'A community for pet lovers',
                        style: TextStyle(
                          fontSize: size.width * .04,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: size.width * .05,
          ),
          Container(
            width: size.width,
            height: size.height * .6,
            child: Container(
              width: size.width,
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    size.width * .08, 0.0, size.width * .08, 0.0),
                child: Column(
                  children: [
                    Container(
                      width: size.width,
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(00, 0.0, 0.0, 0.0),
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: size.width * .06,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: size.width,
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding:
                            EdgeInsets.fromLTRB(00, 0.0, 0.0, size.width * .08),
                        child: Text(
                          'It is easy and secured to register',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: size.width * .032,
                          ),
                        ),
                      ),
                    ),
                    _textFormBuilder('Username'),
                    SizedBox(
                      height: size.width * .04,
                    ),
                    _textFormBuilder('Phone no.'),
                    SizedBox(
                      height: size.width * .04,
                    ),
                    _textFormBuilder('Address'),
                    SizedBox(
                      height: size.width * .04,
                    ),
                    Container(
                      width: size.width,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                              00, size.width * .038, 0.0, size.width * .038),
                          child: Text(
                            'REGISTER',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: size.width * .04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(size.width * .025),
                        ))),
                      ),
                    ),
                    SizedBox(
                      height: size.width * .04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(
                              0.0, size.width * .02, 0.0, size.width * .02),
                          child: Text(
                            'Already registered?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: size.width * .038,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(size.width * .02,
                              size.width * .02, 0.0, size.width * .02),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            },
                            child: Text(
                              'Log in',
                              style: TextStyle(
                                color: Colors.deepOrange,
                                fontSize: size.width * .038,
                                fontWeight: FontWeight.bold,
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
          ),
        ],
      ),
    );
  }

  Widget _textFormBuilder(String hint) {
    return TextFormField(
      controller: hint == 'Username'
          ? _usernameController
          : hint == 'Phone no.'
              ? _phoneController
              : _addressController,
      decoration: InputDecoration(
        labelText: hint,
        prefixIcon: hint == 'Username'
            ? Icon(
                Icons.person,
                color: Colors.black,
              )
            : hint == 'Phone no.'
                ? Icon(
                    Icons.phone_android_outlined,
                    color: Colors.black,
                  )
                : Icon(
                    Icons.location_on,
                    color: Colors.black,
                  ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
            color: Colors.deepOrange,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
      cursorColor: Colors.black,
    );
  }
}
