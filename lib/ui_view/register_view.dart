import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fyp_admin_app/utils/app_theme.dart';
import 'package:fyp_admin_app/widget/colored_button.dart';
import 'package:fyp_admin_app/widget/app_bar/secondary_app_bar.dart';
import 'package:fyp_admin_app/widget/text_field_input.dart';

import 'package:fyp_admin_app/bottom_bar_view.dart';
import 'package:fyp_admin_app/ui_view/login_view.dart';
import 'package:fyp_admin_app/resources/auth_methods.dart';
import 'package:fyp_admin_app/utils/utils.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _reenterPasswordController = TextEditingController();
  String usernameErrorMsg = "";
  String emailErrorMsg = "";
  String passwordErrorMsg = "";
  String reenterPasswordErrorMsg = "";

  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
      usernameErrorMsg = "";
      emailErrorMsg = "";
      passwordErrorMsg = "";
    });

    bool usernameFormatCorrected = false;
    bool emailFormatCorrected = false;
    bool passwordFormatCorrected = false;
    bool reenterPasswordFormatCorrected = false;

    if (_usernameController.text == "") {
      setState(() {
        usernameErrorMsg = "The Username cannot be empty.";
      });
    } else {
      usernameFormatCorrected = true;
    }

    if (_emailController.text == "") {
      setState(() {
        emailErrorMsg = "Please enter your email address.";
      });
    } else if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_emailController.text)) {
      setState(() {
        emailErrorMsg = "Incorrect email format.\nPlease enter the correct email.";
      });
    } else {
      emailFormatCorrected = true;
    }

    if (_passwordController.text == "") {
      setState(() {
        passwordErrorMsg = "Please enter your new password.";
      });
    } else if (_passwordController.text.length < 6) {
      setState(() {
        passwordErrorMsg = "Please enter at least 6 or more characters.";
      });
    } else {
      passwordFormatCorrected = true;
    }

    if (_reenterPasswordController.text == "") {
      setState(() {
        reenterPasswordErrorMsg = "Please re-enter your new password.";
      });
    } else if (_reenterPasswordController.text.length < 6) {
      setState(() {
        reenterPasswordErrorMsg = "Please enter at least 6 or more characters.";
      });
    } else if (_passwordController.text != _reenterPasswordController.text) {
      setState(() {
        reenterPasswordErrorMsg = "The password doesn't match the password enter above.";
      });
    } else {
      reenterPasswordFormatCorrected = true;
    }

    if (usernameFormatCorrected && emailFormatCorrected
        && passwordFormatCorrected && reenterPasswordFormatCorrected) {
      String res = await AuthMethods().signUpUser(
        email: _emailController.text,
        password: _passwordController.text,
        username: _usernameController.text,);

      // if string returned is success, user has been created
      if (res == "success") {
        setState(() {
          _isLoading = false;
        });
        // navigate to the home screen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const BottomBarView(selectedIndex: 0),
          ),
        );
      } else {
        setState(() {
          _isLoading = false;
        });
        // show the error
        showSnackBar(context, res);
      }
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
      child: CircularProgressIndicator(),
    ) : Scaffold(
      appBar: const SecondaryAppBar(
          title: "Register an Admin Account"
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50.0),
              const Text(
                "Travel Guide",
                style: TextStyle(
                  color: AppTheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
              const SizedBox(height: 5.0),
              const Text(
                "Admin Registration",
                style: TextStyle(
                  color: AppTheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 25.0),
              // user name textfield
              TextFieldInput(
                textEditingController: _usernameController,
                hintText: "Username",
                textInputType: TextInputType.text,
                errorMsg: usernameErrorMsg,
                iconData: Icons.person,
              ),

              const SizedBox(height: 10.0),

              // email textfield
              TextFieldInput(
                textEditingController: _emailController,
                hintText: "Email",
                textInputType: TextInputType.emailAddress,
                errorMsg: emailErrorMsg,
                iconData: Icons.email_outlined,
              ),

              const SizedBox(height: 10.0),
              // password textfield
              TextFieldInput(
                textEditingController: _passwordController,
                hintText: "Password",
                isPass: true,
                textInputType: TextInputType.text,
                errorMsg: passwordErrorMsg,
                iconData: Icons.lock_open_sharp,
              ),
              const SizedBox(height: 10.0),
              // password textfield
              TextFieldInput(
                textEditingController: _reenterPasswordController,
                hintText: "Re-enter Password",
                isPass: true,
                textInputType: TextInputType.text,
                errorMsg: reenterPasswordErrorMsg,
                iconData: Icons.lock_open_sharp,
              ),
              const SizedBox(height: 10.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: ColoredButton(
                  childText: "Register",
                  onPressed: signUpUser,
                ),
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Have an account?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ),
                    ),
                    child: Text(
                      " Login",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}