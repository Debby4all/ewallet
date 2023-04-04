import 'package:flutter/material.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  bool _isLoading = false;
  bool _isSent = false;

  Widget _resendEmailButton() {
    return Column(
      children: [
        Text(
          "Didn't receive any email ?",
        ),
        TextButton(
          child: Text( _isLoading ? 'On its way' :
            'Resend',
            style: TextStyle(color: Colors.black),
          ),
          onPressed: () async {
            setState(() =>
              _isLoading = true,
            );

            await Future.delayed(Duration(seconds: 2));

            setState(() {
              _isLoading = false;
              _isSent = true;
            });
          },
        ),
      ],
    );
  }

  Widget _resendEmailMsg() {
    return Container(
      child: Text(
        'Email Sent',
        style: TextStyle(
          color: Colors.green,
        ),
      ),
    );
  }

  Widget _buttonWidget() {
    return _isSent ? _resendEmailMsg() : _resendEmailButton();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.all(10),
            child: Icon(Icons.drag_handle),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.alternate_email,
                  size: 50,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Verify your Email',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'We have sent a confirmation link to your email address,',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  height: 40,
                  indent: 50,
                  endIndent: 50,
                ),
                Text(
                  'Please, click on the link to continue your registration.',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Divider(
                  height: 40,
                  indent: 50,
                  endIndent: 50,
                ),
                _buttonWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
