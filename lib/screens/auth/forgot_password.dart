import 'package:ewallet/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../widgets/widget_auth.dart';
import '../../widgets/widgets.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _email = TextEditingController();
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
 

  Widget _inputEmail() {
    return TextFormField(
      controller: _email,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        hintText: 'Email',
        helperText: 'Enter Your Email',
      ),
      validator: (val) => uValidator(value: '$val',
      isRequired: true,
      isEmail: true,
      ),
    );
  }

  Widget _inputSubmit() {
    return wInputSubmit(title: 'Send', onPressed: _forgotPasswordPeriod);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: _isLoading
          ? wAppLoading(context)
          : Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.black),
              ),
              resizeToAvoidBottomInset: false,
              body: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      wAuthTitle(
                          title: 'Forgot Password',
                          subtitle:
                              'Enter your email and a link will be sent to reset your password'),
                      _inputEmail(),
                      SizedBox(
                        height: 30,
                      ),
                      _inputSubmit(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  void _forgotPasswordPeriod() async {
    if (!_formKey.currentState!.validate()) return;
    if (_email.text.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });
      print('Great!');
      await Future.delayed(
        Duration(seconds: 2),
      );
      wShowToast('Email sent! Please, check your email to reset password.');
      Navigator.pop(context);
    } else {
      print('Error!');
    }
  }
}
