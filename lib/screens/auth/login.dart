import 'package:ewallet/screens/auth/Sign_up.dart';
import 'package:ewallet/screens/auth/forgot_password.dart';
import 'package:ewallet/widgets/widgets.dart';
import 'package:flutter/material.dart';
import '../../utils/utils.dart';
import '../../widgets/widget_auth.dart';
import '../home/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _obscureText = true;
  bool _isLoading = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _inputEmail() {
    return Container(
      child: TextFormField(
        controller: _email,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Email',
        ),
        validator: (val) => uValidator(
          value: '$val',
          isRequired: true,
          isEmail: true,
        ),
      ),
    );
  }

  Widget _inputPassword() {
    return Stack(
      children: [
        Container(
          child: TextFormField(
            controller: _password,
            obscureText: _obscureText,
            decoration: InputDecoration(
              hintText: 'Password',
            ),
            validator: (val) => uValidator(
              value: '$val',
              isRequired: true,
              minLength: 6,
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey[600],
            ),
            onPressed: () {
              setState(() => _obscureText = !_obscureText);
            },
          ),
        ),
      ],
    );
  }

  Widget _forgotPassword() {
    return GestureDetector(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
            child: Text('Forgot Password?'),
          ),
        ),
        onTap: () => wPushTo(
              context,
              ForgotPassword(),
            ));
  }

  Widget _inputSubmit() {
    return wInputSubmit(title: 'Login', onPressed: _loginPeriod);
  }

  Widget _googleSignIn() {
    return wGoogleSignIn(onPressed: () {});
  }

  Widget _textRegister() {
    return wTextLink(
      text: "Don't have an Account ?",
      title: 'Sign up',
      onTap: () => wPushReplaceTo(
        context,
        SignUp(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: _isLoading
          ? wAppLoading(context)
          : Scaffold(
              resizeToAvoidBottomInset: false,
              body: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      wAuthTitle(
                        title: 'Login',
                        subtitle: 'Enter your email and password',
                      ),
                      _inputEmail(),
                      _inputPassword(),
                      _forgotPassword(),
                      _inputSubmit(),
                      wtextDivider(),
                      _googleSignIn(),
                      _textRegister(),
                    ],
                  ),
                ),
              )),
    );
  }

  void _loginPeriod() async {
    if (!_formKey.currentState!.validate()) return;

    if (_email.text == 'demo@gmail.com' && _password.text == '123123') {
      setState(() {
        _isLoading = true;
      });
      await Future.delayed(Duration(seconds: 2));
      wPushReplaceTo(context, Home());
    } else {
      print('Error!');
    }
  }
}
