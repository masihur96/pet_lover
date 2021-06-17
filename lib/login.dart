import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pet_lover/home.dart';
import 'package:pet_lover/register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _phoneNo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'login',
        ),
        leading: Icon(
          Icons.arrow_back_sharp,
        ),
      ),
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: 30.0,
              child: Column(
                children: [
                  Container(
                    height: size.height * .20,
                    width: size.width,
                    child: Stack(
                      children: [
                        Positioned(
                          right: 10.0,
                          child: Image.asset(
                            'assets/animal_logo.png',
                            height: size.height * .20,
                            width: size.height * .20,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  20.0, 30.0, 30.0, 0.0),
                              child: Text(
                                'Pet Lover',
                                style: TextStyle(
                                  fontSize: size.width * .10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'MateSC',
                                  //decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  20.0, 0.0, 0.0, 0.0),
                              child: Text(
                                'A community for pet lovers',
                                style: TextStyle(
                                  fontSize: size.width * .035,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0.0,
              child: Container(
                height: size.height * .65,
                width: size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50.0),
                      topLeft: Radius.circular(50.0),
                    ),
                  ),
                  margin: EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(30.0, 40.0, 0.0, 0.0),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: size.width * .06,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30.0, 2.0, 0.0, 0.0),
                        child: Text(
                          'Get logged in for better experience',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: size.width * .032,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                        child: _textFormBuilder('Your mobile number'),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                        child: Text(
                          'Each time you logged in, you will be verified through an OTP sending to your mobile number',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: size.width * .13,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Home()));
                                  },
                                  child: Text(
                                    'LOG IN',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: size.width * .04,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ))),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                            child: Text(
                              'Do not have account?',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: size.width * .038,
                              ),
                            ),
                          ),
                          GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  3.0, 20.0, 0.0, 0.0),
                              child: Text(
                                'Register here',
                                style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontSize: size.width * .038,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register()));
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              child: Container(
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          '\u201CUntil one has loved an animal, a part of one\u0027s soul remain unawakened.\u201D - Anatole France',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'MateSC',
                            fontSize: size.width * .04,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _textFormBuilder(String hint) {
    return TextFormField(
      controller: _phoneNo,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
      validator: (value) {
        if (value!.isEmpty)
          return 'Enter $hint';
        else if (value.length != 11)
          return 'Mobile number must be of 11 digits';
        else
          return null;
      },
      decoration: InputDecoration(
        labelText: hint,
        prefixIcon: Icon(
          Icons.phone_android_outlined,
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
