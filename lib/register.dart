import 'package:aicamzone/login.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controllerEmail = TextEditingController();
    TextEditingController controllerUser = TextEditingController();
    TextEditingController controllerTelp = TextEditingController();
    TextEditingController controllerPass = TextEditingController();

    void register(String email, username, telfon, password) async {
      try {
        var response = await Dio().post('http://192.168.100.199:3000/users',
            data: {"email": email, "username": username, "telfon": telfon, "password": password});
        if (response.data.length > 0) {
          print("Account created successfully");
          Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Login()));
        } else {
          print("Failed");
        }
      } catch (e) {
        print(e);
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
                  image: AssetImage("assets/image/signup.png"), 
                  fit: BoxFit.cover,
                )
              ),
              child: Column(
                  children: <Widget>[
                    SizedBox(height: 45),
                    Text("Register", style: TextStyle(
                      fontSize: 33,
                      fontFamily: 'Poppins-ExtraBold',
                      color: Colors.white
                    ),
                    ),
                    SizedBox(height: 10),
                    Text("Create A New Account", 
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Poppins-Light',
                        color: Colors.white
                      ),
                    ),
                    Image.asset("assets/image/2.png",
                    height: 300,
                    width:  300,
                    ),
                    
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
                      controller: controllerUser,
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
                        prefixIcon: Icon(Icons.person),
                        hintText: "Username",
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
                      controller: controllerTelp,
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
                        prefixIcon: Icon(Icons.call),
                        hintText: "Telpon",
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
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        register(controllerEmail.text, controllerUser, controllerTelp, controllerPass.text);
                      },
                      child: const Text("Register",
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
                          'Already have an account?',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins-Medium',
                            )
                          ),
                          TextButton(
                            child: const Text(
                              'Login',
                              style: TextStyle(
                              fontFamily: 'Poppins-Medium',
                              fontSize: 15,
                              color: Color.fromARGB(255, 1, 1, 1),
                              ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>Login()));
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
              child: Icon(Icons.keyboard_arrow_left, color: Colors.white, size: 40,),
            ),
          ),
        ],
      ),
    );
  }
}