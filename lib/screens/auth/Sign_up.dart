import 'package:ewallet/screens/auth/login.dart';
import 'package:ewallet/screens/auth/verify_email.dart';
import 'package:ewallet/utils/utils.dart';
import 'package:ewallet/widgets/widgets.dart';
import 'package:flutter/material.dart';
import '../../widgets/widget_auth.dart';
import '../home/home.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _passwordConf = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  Widget _buildForm() {
    return Column(
      children: [
        TextFormField(
          textCapitalization: TextCapitalization.words,
          controller: _name,
          decoration: const InputDecoration(
            hintText: 'Name',
            helperText: 'Enter Full Name',
          ),
          validator: (val) => uValidator(
            value: '$val',
            isRequired: true,
            // minLength: 3,
          ),
        ),
        TextFormField(
          controller: _email,
          decoration: const InputDecoration(
            hintText: 'Email',
            helperText: 'Enter Email',
          ),
          validator: (val) => uValidator(
            value: '$val',
            isRequired: true,
            isEmail: true,
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _password,
                decoration: const InputDecoration(
                  hintText: '******',
                  helperText: 'Enter Password',
                ),
                validator: (val) => uValidator(
                  value: '$val',
                  isRequired: true,
                  minLength: 6,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: TextFormField(
                controller: _passwordConf,
                decoration: const InputDecoration(
                  hintText: '******',
                  helperText: 'Confirm  Password',
                ),
                validator: (val) => uValidator(
                  value: '$val',
                  isRequired: true,
                  minLength: 6,
                  match: _password.text,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _inputSubmit() {
    return wInputSubmit(
      title: 'Sign up',
      onPressed: _registerPeriod,
    );
  }

  Widget _googleSignIn() {
    return wGoogleSignIn(onPressed: () {});
  }

  Widget _textLogin() {
    return wTextLink(
      text: "Already have an Account ?",
      title: 'Log in',
      onTap: () => wPushReplaceTo(
        context,
        Login(),
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
              body: SafeArea(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        wAuthTitle(
                          title: 'Sign up',
                          subtitle: 'Fill the form below to sign up',
                        ),
                        _buildForm(),
                        const SizedBox(
                          height: 30,
                        ),
                        _inputSubmit(),
                        wtextDivider(),
                        _googleSignIn(),
                        _textLogin(),
                      ],
                    ),
                  ),
                ),
              )),
    );
  }

  void _registerPeriod() async {
    if (!_formKey.currentState!.validate()) return;
    print('Full name : ${_name.text}');
    print('Email : ${_email.text}');
    print('Password : ${_password.text}');
    print('Confirm Password : ${_passwordConf.text}');

    setState(() => _isLoading = true);

    await Future.delayed(Duration(seconds: 2));
    wPushReplaceTo(context, Login());

    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return VerifyEmail();
        });
  }
}
