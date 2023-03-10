import 'package:flutter/material.dart';
import 'package:moschos_class/controllers/auth_controller.dart';
import 'package:moschos_class/utilti/const.dart';
import 'package:moschos_class/views/screens/auth/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final AuthController _authController = AuthController();

  bool _isLoading = false;

  // final TextEditingController _emaiController = TextEditingController();

  // final TextEditingController _fullNameController = TextEditingController();

  // final TextEditingController _passwordController = TextEditingController();

  late String emailAddress;

  late String fullName;

  late String password;

  _signUpUsers() async {
    setState(() {
      _isLoading = true;
    });
    if (_formKey.currentState!.validate()) {
      String res =
          await _authController.signUpUSers(emailAddress, fullName, password);

      if (res == 'success') {
        setState(() {
          _isLoading = false;
        });
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return LoginScreen();
        }));

        _formKey.currentState!.reset();
        return snackBarShow(
            context, 'Congratulations Account has been Create For you');
      } else {
        setState(() {
          _isLoading = false;
        });
        return snackBarShow(context, res);
      }
    } else {
      setState(() {
        _isLoading = false;
      });

      return snackBarShow(context, 'Please Fields must not be empty');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Register Account',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: TextFormField(
                onChanged: (value) {
                  emailAddress = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Email Address Must not be empty';
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Enter Email Address',
                  labelStyle: TextStyle(
                    fontSize: 15,
                  ),
                  hintText: 'Enter Email Address',
                  hintStyle: TextStyle(
                    fontSize: 15,
                  ),
                  prefixIcon: Icon(
                    Icons.email,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
              ),
              child: TextFormField(
                onChanged: (value) {
                  fullName = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Full Name';
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Enter Full Name',
                  labelStyle: TextStyle(
                    fontSize: 15,
                  ),
                  hintText: ' Enter Full Name',
                  hintStyle: TextStyle(
                    fontSize: 15,
                  ),
                  prefixIcon: Icon(
                    Icons.person,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: TextFormField(
                onChanged: (value) {
                  password = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Passsword Must not be empty';
                  } else {
                    return null;
                  }
                },
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Enter Password',
                  labelStyle: TextStyle(
                    fontSize: 15,
                  ),
                  hintText: ' Enter Password',
                  hintStyle: TextStyle(
                    fontSize: 15,
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                _signUpUsers();
              },
              child: Container(
                width: MediaQuery.of(context).size.width - 40,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                child: Center(
                    child: _isLoading
                        ? CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 4,
                            ),
                          )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already Have An Account'),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginScreen();
                    }));
                  },
                  child: Text(
                    'Login',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
