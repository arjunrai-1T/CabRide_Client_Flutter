import 'package:cab/constants.dart';
import 'package:cab/resfont.dart';
import 'package:cab/screens/authentication/signin.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  State<SignUp> createState() => SignUpState();
}

TextEditingController _emailId = TextEditingController();
TextEditingController _password = TextEditingController();
TextEditingController _confirmpassword = TextEditingController();
TextEditingController _userName = TextEditingController();
TextEditingController _mobileno = TextEditingController();

class SignUpState extends State<SignUp> {
  bool showPassword = true;
  bool showPassword1 = true;
  final formKey = GlobalKey<FormState>();

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
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight * 0.085,
                ),
                Text(
                  "Here to Get",
                  style: TextStyle(fontSize: 30, color: kPrimaryColor),
                ),
                Text(
                  "Welcomed !",
                  style: TextStyle(fontSize: 30, color: kPrimaryColor),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.075,
                ),
                userNameTextField(),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.01,
                ),
                emailTextField(),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.01,
                ),
                passwordTextField(),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.01,
                ),
                confirmPasswordTextField(),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.01,
                ),
                mobileNoTextField(),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.01,
                ),
                signUpButton(),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.04,
                ),
                toLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget emailTextField() {
    return Container(
      height: 80,
      child: TextFormField(
        controller: _emailId,
        onChanged: (value) async {
          print(value.toString());
          // List<Logininfo> LogininfoList = await SqlLiteDbObj.retrieveUserLogin();

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
  }

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

  Widget confirmPasswordTextField() {
    return Container(
      height: 80,
      child: TextFormField(
        controller: _confirmpassword,
        validator: (val) => val.length == 0
            ? 'Please enter your confirm password'
            : _password.text != val
                ? 'Password Can’t Match..'
                : null,
        obscureText: showPassword1,
        decoration: InputDecoration(
          //floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.teal,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: kPrimaryColor,
              width: 2,
            ),
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                showPassword1 = !showPassword1;
              });
            },
            icon: Icon(
              showPassword1
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: kPrimaryColor,
              size: 20,
            ),
          ),
          labelText: "Confirm Password",
          //helperText: "Profession is required.",
          //hintText: "*************",
        ),
      ),
    );
  }

  Widget userNameTextField() {
    return Container(
      height: 80,
      child: TextFormField(
        controller: _userName,
        validator: (value) {
          if (value.isEmpty) return "Please enter your name";
          return null;
        },
        textCapitalization: TextCapitalization.sentences,
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
            ),
          ),
          suffixIcon: Icon(
            Icons.person_outline,
            color: kPrimaryColor,
          ),
          labelText: "Your Name",
          //helperText: "Name is required.",
          //errorText: 'dasdad',
          // hintText: "Kathy Wills",
        ),
      ),
    );
  }

  Widget mobileNoTextField() {
    return Container(
      height: 80,
      child: TextFormField(
        maxLength: 10,
        controller: _mobileno,
        validator: (value) {
          if (value.isEmpty) return "Please enter your mobile no";

          return null;
        },
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          counterText: "",
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
            Icons.smartphone_outlined,
            color: kPrimaryColor,
          ),
          labelText: "Mobile Number",
          //helperText: "Profession is required.",
          //hintText: "1299212131",
        ),
      ),
    );
  }

  Widget signUpButton() {
    return Container(
      width: SizeConfig.screenWidth,
      child: NeumorphicButton(
        margin: EdgeInsets.only(top: 12),
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
            'Signup',
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

  Widget toLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          // color: Colors.red,
          padding: EdgeInsets.fromLTRB(5, 25, 20, 10),
          child: Text(
            'already have an account',
          ),
        ),
        NeumorphicButton(
          margin: EdgeInsets.only(top: 12),
          onPressed: () async {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SignIN(),
                ));
            //++else end
          },
          style: NeumorphicStyle(
            shape: NeumorphicShape.convex,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(35)),
            depth: 2,
            color: kPrimaryColor,
          ),
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Text(
            'Login',
            style: TextStyle(
              fontSize: SizeConfig.screenHeight * 0.020,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
