import 'dart:io';

import 'package:cab/constants.dart';
import 'package:cab/custom_alert_dialog.dart';
import 'package:cab/resfont.dart';
import 'package:cab/screens/authentication/signup.dart';
import 'package:cab/screens/home.dart';
import 'package:cab/screens/searchingDriver.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SignIN extends StatefulWidget {
  SignIN({Key key}) : super(key: key);

  @override
  State<SignIN> createState() => _SignINState();
}

class _SignINState extends State<SignIN> {
  bool showPassword = true;
  bool ischecked = false;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _emailId = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _forgotemailId = TextEditingController();

  Future<bool> _willPopCallback() {
    // await showDialog or Show add banners or whatever
    // then
    debugPrint("_popCamera");
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          // TextEditingController _emailControllerField =
          TextEditingController();
          return AlertDialog(
            title: Text('Do you really want to exit the app?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text('No'),
              ),
              TextButton(
                onPressed: () => exit(0),
                child: Text('Yes'),
              ),
            ],
          );
        });

    //print(1);
    // exit(0);
    //return Future.value(true);
  }

  void _submitCommand() async {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      // Email & password matched our validation rules
      // and are saved to _email and _password fields.
      //_loginCommand();
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    void showAlertDialog(BuildContext context) {
      _forgotemailId.text = "";
      showDialog(
          context: context,
          builder: (BuildContext context) {
            // TextEditingController _emailControllerField =
            TextEditingController();
            return CustomAlertDialog(
              contentPadding: EdgeInsets.all(0),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //++Header
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15)),
                            color: kPrimaryColor,
                          ),
                          //height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Forgot Password',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        1.7 * SizeConfig.blockSizeVertical,
                                    fontWeight: FontWeight.w600),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: Icon(
                                  Icons.clear_outlined,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),

                        //++TextField
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 0.00, 20, 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextField(
                                controller: _forgotemailId,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    labelText: 'EMAIL',
                                    labelStyle: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            1.7 * SizeConfig.blockSizeVertical,
                                        color: Colors.grey),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue))),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),

                        //++Ok
                        GestureDetector(
                          onTap: () async {},
                          child: Container(
                            padding: EdgeInsets.fromLTRB(20, 0.00, 20, 20),
                            child: Material(
                              borderRadius: BorderRadius.circular(10.0),
                              shadowColor: Colors.grey,
                              color: kPrimaryColor,
                              elevation: 5.0,
                              child: Container(
                                height: 5 * SizeConfig.blockSizeVertical,
                                child: Center(
                                  child: Text(
                                    'SEND',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat',
                                      fontSize:
                                          1.7 * SizeConfig.blockSizeVertical,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
    } //void showAlertDialog(BuildContext context) end

    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        key: scaffoldKey,
        //resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        body: Container(
          child: ListView(
            padding: EdgeInsets.only(
              top: 25 * SizeConfig.blockSizeVertical,
              left: 20.0,
              right: 20.0,
              bottom: 25,
            ),
            children: <Widget>[
              Column(
                //crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //++crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 14 * SizeConfig.blockSizeVertical,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Container(
                          //   height: 60.0,
                          //   width: 60.0,
                          //   transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                          //   decoration: new BoxDecoration(
                          //     image: DecorationImage(
                          //       image: new AssetImage(
                          //           'assets/images/login_logo.png'),
                          //       fit: BoxFit.fill,
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              child: Text('Log in to your Account',
                                  style: TextStyle(
                                    fontSize:
                                        2.2 * SizeConfig.blockSizeVertical,
                                    color: kPrimaryColor,
                                  ))),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  //++Remember Me and Forgot Password
                  Container(
                    //padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: <Widget>[
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              emailTextField(),
                              SizedBox(height: 10.0),
                              passwordTextField(),
                            ],
                          ),
                        ),

                        // SizedBox(height: 5.0),

                        //++Remember Me
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            //++Remember Me
                            // Row(
                            //   children: [
                            //     Checkbox(
                            //       value: ischecked,
                            //       onChanged: (bool value) {
                            //         setState(() {
                            //           ischecked = value;
                            //         });
                            //       },
                            //     ),
                            //     Text(
                            //       "Remember Me",
                            //       style: TextStyle(
                            //         fontWeight: FontWeight.bold,
                            //         fontSize: 1.5 * SizeConfig.blockSizeVertical,
                            //       ),
                            //     )
                            //   ],
                            // ),

                            //++Forgot Password
                            Container(
                              //alignment: Alignment(1.0, 0.0),
                              //padding: EdgeInsets.only(top: 15.0, left: 20.0),
                              child: TextButton(
                                onPressed: () => showAlertDialog(context),
                                child: Text(
                                  'Forgot Password',
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat',
                                    decoration: TextDecoration.underline,
                                    fontSize:
                                        1.5 * SizeConfig.blockSizeVertical,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        // SizedBox(height: 10.0),

                        //++Login
                        signInButton(),

                        // SizedBox(height: 10.0),

                        guestUserButton(),

                        SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //++Dont Have any account
                      Text(
                        "Don't have an account ? ",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 1.5 * SizeConfig.blockSizeVertical,
                        ),
                      ),

                      SizedBox(width: 5.0),

                      InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SignUp(),
                          ),
                        ),
                        child: Text(
                          'Create an account',
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            fontSize: 1.5 * SizeConfig.blockSizeVertical,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),

        bottomNavigationBar: Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  'Powered By',
                  style: TextStyle(
                    fontSize: 1.4 * SizeConfig.blockSizeVertical,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              // Container(
              //   height: 20.0,
              //   width: 20.0,
              //   transform: Matrix4.translationValues(0.0, 0.0, 0.0),
              //   decoration: new BoxDecoration(
              //     image: DecorationImage(
              //       image: new AssetImage('assets/images/login_logo.png'),
              //       fit: BoxFit.fill,
              //     ),
              //   ),
              // ),
              SizedBox(
                width: 2,
              ),
              Container(
                child: Text(
                  'CAB',
                  style: TextStyle(
                      fontSize: 1.4 * SizeConfig.blockSizeVertical,
                      color: Colors.blue,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  } //++ Widget build(BuildContext context) end

  Widget emailTextField() {
    return Container(
      height: 80,
      child: TextFormField(
        controller: _emailId,
        onChanged: (value) async {
          print(value.toString());
          //++for end
        },
        validator: (val) => val.length == 0
            ? 'Please enter your email address'
            : !EmailValidator.validate(val, true)
                ? 'Not a valid email.'
                : null,
        //onSaved: (val) => _emailId = _emailId..text = val,
        onSaved: (val) async {
          _emailId.text = val;
          print("[onSaved] Value: " + val.toString());
        },
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          //floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.teal,
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: kPrimaryColor,
            width: 2,
          )),
          suffixIcon: Icon(
            Icons.email_outlined,
            color: kPrimaryColor,
          ),
          labelText: "Email",
          //helperText: "Profession can't be empty",
          //hintText: "kathy.wills@gmail.com",
        ),
      ),
    );
  } //++ Widget emailTextField() end

  Widget passwordTextField() {
    return Container(
      height: 80,
      child: TextFormField(
        controller: _password,
        validator: (val) => val.length == 0
            ? 'Please enter your password'
            : val.length < 5
                ? 'Password too short..'
                : null,
        onSaved: (val) => _password = _password,
        obscureText: showPassword,
        decoration: InputDecoration(
          //floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.teal,
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: kPrimaryColor,
            width: 2,
          )),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                showPassword = !showPassword;
              });
            },
            icon: Icon(
              showPassword
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: kPrimaryColor,
              size: 20,
            ),
          ),
          labelText: "Password",
          //helperText: "Profession can't be empty",
          //hintText: "*************",
        ),
      ),
    );
  }

  Widget signInButton() {
    return Container(
      width: SizeConfig.screenWidth,
      child: NeumorphicButton(
        margin: EdgeInsets.only(top: 1),
        onPressed: () async {
          _submitCommand(); //++else end
        },
        style: NeumorphicStyle(
            shape: NeumorphicShape.convex,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
            depth: 2,
            color: kPrimaryColor
            // color: kSecondaryColor,
            ),
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Center(
          child: Text(
            'Login',
            style: TextStyle(
              fontSize: SizeConfig.screenHeight * 0.025,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              // color: kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget guestUserButton() {
    return Container(
      width: SizeConfig.screenWidth,
      child: NeumorphicButton(
        margin: EdgeInsets.only(top: 12),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => MyHomePage(),
            ),
          );
        },
        style: NeumorphicStyle(
            shape: NeumorphicShape.convex,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
            depth: 2,
            color: kPrimaryColor
            // color: kSecondaryColor,
            ),
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Center(
          child: Text(
            'GuestUser',
            style: TextStyle(
              fontSize: SizeConfig.screenHeight * 0.025,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
