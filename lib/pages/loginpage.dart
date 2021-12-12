import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;

  final _fromKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_fromKey.currentState!.validate()) {
      // Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);

      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Theme.of(context).canvasColor,
        child: SingleChildScrollView(
          child: Form(
            key: _fromKey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/hey.png",
                  fit: BoxFit.cover,
                  // height: 500,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Welcome $name",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter User Name",
                          labelText: "UserName",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username Cannot be empty";
                          }

                          return null;
                        },
                        onChanged: (value) {
                          name = value;

                          setState(() {});
                        },
                      ),

                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password Cannot be empty";
                          } else if (value.length < 6) {
                            return "Password length should be atleast 6";
                          }

                          return null;
                        },
                      ),

                      SizedBox(
                        height: 40.0,
                      ),

                      // ElevatedButton(
                      //   onPressed: ()
                      //   {
                      //     Navigator.pushNamed(context, MyRoutes.homeRoute);

                      //   },
                      //   child: Text("Login"),
                      //   style: TextButton.styleFrom(
                      //     minimumSize: Size(150,40))

                      //   ),

                      Material(
                        color: Theme.of(context).buttonColor,
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 8),
                        child: InkWell(
                          // splashColor: Colors.red,
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: changeButton ? 50 : 150,
                            height: 50,
                            // color:  Colors.deepPurple,
                            alignment: Alignment.center,

                            child: changeButton
                                ? Icon(Icons.done, color: Colors.white)
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 18),
                                  ),
                            //  decoration: BoxDecoration(
                            //    color: Colors.deepPurple,
                            //   //  shape: changeButton?BoxShape.circle : BoxShape.rectangle,

                            //  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
