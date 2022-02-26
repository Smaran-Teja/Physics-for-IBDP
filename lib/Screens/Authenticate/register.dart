import 'package:physics_for_ibdp/Firebase%20Services/auth.dart';
import 'package:physics_for_ibdp/Shared/constants.dart';
import 'package:physics_for_ibdp/Shared/loading.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  // ignore: use_key_in_widget_constructors
  const Register({required this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;
  bool hl = false;

  // text field state
  String email = '';
  String password = '';
  String username = '';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: const Color(0xFF262626),
            appBar: AppBar(
              backgroundColor: const Color(0xFF1a1a1a),
              elevation: 0.0,
              title: const Text('Register with this app'),
              actions: <Widget>[
                TextButton(
                  child: const Text('Login',
                      style: TextStyle(color: Colors.orange)),
                  onPressed: () => widget.toggleView(),
                ),
              ],
            ),
            body: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 50.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 20.0),
                        TextFormField(
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Username'),
                          validator: (val) => val!.isEmpty || val == "a"
                              ? 'Enter your username'
                              : null,
                          onChanged: (val) {
                            setState(() => username = val);
                          },
                        ),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          decoration:
                              textInputDecoration.copyWith(hintText: 'email'),
                          validator: (val) =>
                              val!.isEmpty ? 'Enter an email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          decoration: textInputDecoration.copyWith(
                              hintText: 'password'),
                          obscureText: true,
                          validator: (val) => val!.length < 6
                              ? 'Enter a password 6+ chars long'
                              : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),
                const Text("Choose your level",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: height * 0.3,
                      width: width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        color: hl == false
                            ? Colors.orangeAccent
                            : const Color(0xFF666666),
                      ),
                      child: TextButton(
                        style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent)),
                        onPressed: () {
                          setState(() {
                            hl = false;
                          });
                        },
                        child: const Text("SL",
                            style:
                                TextStyle(color: Colors.black, fontSize: 40)),
                      ),
                    ),
                    Container(
                      height: height * 0.3,
                      width: width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        color: hl == true
                            ? Colors.orangeAccent
                            : const Color(0xFF666666),
                      ),
                      child: TextButton(
                        style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent)),
                        onPressed: () {
                          setState(() {
                            hl = true;
                          });
                        },
                        child: const Text("HL",
                            style:
                                TextStyle(color: Colors.black, fontSize: 40)),
                      ),
                    )
                  ],
                ),
                SizedBox(height: height * 0.05),
                TextButton(
                    style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent)),
                    child: const Text(
                      'Register',
                      style:
                          TextStyle(color: Colors.orangeAccent, fontSize: 20),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() => loading = true);
                        dynamic result =
                            await _auth.registerWithEmailAndPassword(
                                username, email, password, hl);
                        if (result == null) {
                          //print("Null");
                          setState(() {
                            loading = false;
                            error = 'Please supply a valid email';
                          });
                        }
                      }
                    }),
                SizedBox(height: height * 0.05),
                Text(
                  error,
                  style: const TextStyle(color: Colors.red, fontSize: 14.0),
                )
              ],
            ),
          );
  }
}
