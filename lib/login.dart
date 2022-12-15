import 'package:aicamzone/home.dart';
import 'package:aicamzone/register.dart';
import 'package:aicamzone/user.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controllerEmail = TextEditingController();
    TextEditingController controllerPass = TextEditingController();

    void login(String email, password) async {
      try {
        var response = await Dio().get('http://192.168.100.199:3000/users?email=' +
            email +
            '&password=' +
            password);
        if (response.data.length > 0) {
          int id = response.data[0]['id'];
          String username = response.data[0]['username'];
          String email = response.data[0]['email'];
          String password = response.data[0]['password'];
          String telfon = response.data[0]['telfon'];

          print("Login success");
          Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user: User(id: id, email: email, password: password, username: username, telfon: telfon),)));
        } else {
          final snackBar = SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text(
              'Invalid email or password',
              style: TextStyle(
                fontFamily: 'Poppins-Regular',
                color: Colors.white,
              ),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      } catch (e) {
        final snackBar = SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            e.toString(),
            style: TextStyle(
              fontFamily: 'Poppins-Regular',
              color: Colors.white,
            ),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            width: double.infinity,
            height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/image/login.png"), 
                  fit: BoxFit.cover,
                )
              ),
              child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    Image.asset("assets/image/3.png",
                    height: 343,
                    width:  320,
                    ),
                    Text("Welcome Back", style: TextStyle(
                      fontSize: 33,
                      fontFamily: 'Poppins-ExtraBold',
                      color: Colors.white
                    ),
                    ),
                    SizedBox(height: 10),
                    Text("Photography teaches us a unique way of \n seeing the world and at the same time \n provides a new awareness of all the beauty \n that is around us", 
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Poppins-Light',
                      color: Colors.white
                    ),
                    ),
                    SizedBox(height: 25),
                      TextField(
                      controller: controllerEmail,
                      style: const TextStyle(
                        fontFamily: 'Poppins-Medium',
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                       filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white)
                        ),
                        prefixIcon: Icon(Icons.mail),
                        hintText: "Email Address",
                        contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                        hintStyle: const TextStyle(
                          fontFamily: 'Poppins-Medium',
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: controllerPass,
                      style: const TextStyle(
                        fontFamily: 'Poppins-Medium',
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.white)
                        ),
                        prefixIcon: Icon(Icons.lock),
                        hintText: "Password",
                        contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                        hintStyle: const TextStyle(
                          fontFamily: 'Poppins-Medium',
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 16,
                          fontFamily: 'Poppins-Medium',
                        ),
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        login(controllerEmail.text, controllerPass.text);
                      },
                      child: const Text("Login",
                          style: TextStyle(
                            fontFamily: 'Poppins-Regular',
                            fontSize: 24,
                          )),
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 211, 162, 147),
                          minimumSize: const Size.fromHeight(55),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                    ),
                    // SizedBox(height: 10),
                    Row(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Dont have an account yet?',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins-Medium',
                            )
                          ),
                          TextButton(
                            child: const Text(
                              'Register',
                              style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Poppins-Medium',
                              color: Color.fromARGB(255, 1, 1, 1),
                              ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>Register()));
                              },  
                            ),
                        ]
                      ),
                  ],
                ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.white, size: 50,),
            ),
          ),
        ],
      ),
    );
  }
}