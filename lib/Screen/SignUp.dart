import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../Constant/Auth_Ser.dart';
import '../Constant/ButtonItem.dart';
import 'SignIn.dart';

import '../Constant/Constant.dart';
import '../Constant/FromError.dart';
import '../Constant/Messages.dart';
import '../Constant/SizeConfig.dart';
import '../Constant/DefaultButton.dart';
import '../Constant/inputField.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _LoginState();
}

class _LoginState extends State<SignUp> {
  final emailControll = TextEditingController();
  final passwordControll = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _emaic;
  final _password = TextEditingController();
  final List<String?> errors = [];

  void dispose() {
    emailControll.dispose();
    passwordControll.dispose();

    super.dispose();
  }

  String? email;
  String? password;

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void RemoveError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeOfConfig().init(context);
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Color(0xFF1F202B),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              width: SizeOfConfig.widthScreen,
              height: SizeOfConfig.heighScreen,
              margin: EdgeInsets.only(
                left: getWidthScreen(20),
                right: getWidthScreen(20),
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'assets/lottie/sign_up.json',
                    height: 300.0,
                    repeat: true,
                    reverse: true,
                    animate: true,
                  ),
                  TextForm(
                    labelText: "Email",
                    mykeyboardType: TextInputType.emailAddress,
                    obsecureText: false,
                    icon: Icons.email,
                    controller: emailControll,
                    validation: (value) {
                      if (value!.isEmpty) {
                        addError(error: kEmailNullError);
                        return "";
                      } else if (!emailValidatorRegExp.hasMatch(value)) {
                        addError(error: kInvalidEmailError);
                        return "";
                      }
                      return null;
                    },
                    press: (value) {
                      if (value!.isNotEmpty) {
                        RemoveError(error: kEmailNullError);
                      } else if (emailValidatorRegExp.hasMatch(value)) {
                        RemoveError(error: kInvalidEmailError);
                      }
                      _emaic = value;
                    },
                  ),
                  SizedBox(
                    height: getHeightScreen(15),
                  ),
                  TextForm(
                    labelText: "Password",
                    mykeyboardType: TextInputType.visiblePassword,
                    obsecureText: true,
                    icon: Icons.lock,
                    controller: passwordControll,
                    validation: (value) {
                      if (value!.isEmpty) {
                        addError(error: kPassNullError);
                        return "";
                      } else if (value.length < 8) {
                        addError(error: kShortPassError);
                        return "";
                      }
                      return null;
                    },
                    press: (value) {
                      if (value!.isNotEmpty) {
                        RemoveError(error: kPassNullError);
                      } else if (value.length >= 8) {
                        RemoveError(error: kShortPassError);
                      }
                      _password.text = value;
                    },
                  ),
                  SizedBox(
                    height: getHeightScreen(20),
                  ),
                  DefaultButton("Sign Up", () {
                    setState(() {
                      signUp();
                    });
                  }),
                  SizedBox(
                    height: getHeightScreen(15),
                  ),
                  const Text(
                    'or use social media',
                    style: primaryText,
                  ),
                  SizedBox(
                    height: getHeightScreen(15),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buttonItem('assets/svg/google.svg', 30, () {
                        setState(() {
                          AuthSev().signInWithGoogle();
                        });
                      }, context),
                    ],
                  ),
                  SizedBox(
                    height: getHeightScreen(25),
                  ),
                  // FormError(errors: errors),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: hintTextLo,
                      ),
                      TextButton(
                        child: const Text(
                          'Sign In',
                          style: secBtnText,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignIn(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  signUp() async {
    final validate = _formKey.currentState!.validate();
    if (!validate) {
      showDialog(
        context: context,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailControll.text,
        password: passwordControll.text,
      );
      Mesg.showSnakeBar("SignUp Success, Now Sign in, Please", Colors.green);
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SignIn(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      Mesg.showSnakeBar(e.message, Colors.red);
    }
    // try {
    //   await FirebaseAuth.instance.signInWithEmailAndPassword(
    //     email: emailControll.text.trim(),
    //     password: passwordControll.text.trim(),
    //   );
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == 'user-not-found') {
    //     print('No user found for that email.');
    //     addError(error: "No user found for that email.");
    //   } else if (e.code == 'wrong-password') {
    //     print('Wrong password provided for that user.');
    //     addError(error: "Wrong password provided for that user.");
    //   }
    // }
  }
}
