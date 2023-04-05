import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLogin = true;
  late String _userId;
  late String _password;
  late String _email;
  late String _message;

  final TextEditingController txtEmail = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();

  Widget emailInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 120),
      child: TextFormField(
        controller: txtEmail,
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
          hintText: 'email',
          icon: Icon(Icons.email),
        ),
        validator: (text) => text!.isEmpty ? 'Email is required !' : '',
      ),
    );
  }

  Widget passwordInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 120),
      child: TextFormField(
        controller: txtPassword,
        keyboardType: TextInputType.emailAddress,
        obscureText: true,
        decoration: const InputDecoration(
          hintText: 'password',
          icon: Icon(Icons.enhanced_encryption),
        ),
        validator: (text) => text!.isEmpty ? 'Password is required !' : '',
      ),
    );
  }

  Widget mainButton() {
    String buttonText = _isLogin ? 'Login' : 'Sign up';

    return Padding(
      padding: const EdgeInsets.only(top: 120),
      child: SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed: submit,
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 131, 142, 205),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
            child: Text(buttonText),
          )),
    );
  }

  Future submit() async {}

  Widget secondaryButton() {
    String buttonText = !_isLogin ? 'Login' : 'Sign up';

    return TextButton(
        onPressed: () {
          setState(() {
            _isLogin = !_isLogin;
          });
        },
        child: Text(buttonText));
  }

  Widget validationMessage() {
    return Text(
      _message,
      style: const TextStyle(
          fontSize: 14, color: Colors.red, fontWeight: FontWeight.bold),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Form(
            child: Column(children: <Widget>[
              emailInput(),
              passwordInput(),
              mainButton(),
              secondaryButton(),
              validationMessage(),
            ]),
          ),
        ),
      ),
    );
  }
}
