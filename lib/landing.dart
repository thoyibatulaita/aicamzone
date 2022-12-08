import 'package:aicamzone/register.dart';
import 'package:flutter/material.dart';
import 'package:aicamzone/login.dart';
import 'package:aicamzone/register.dart';
class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/image/landing.png"), 
              fit: BoxFit.cover,
            )
          ),
          child: Column(
              children: <Widget>[
                SizedBox(height: 50),
                Image.asset("assets/image/1.png",
                height: 303,
                width:  255,
                ),
                SizedBox(height: 60),
                Text("Photography", style: TextStyle(
                  fontSize: 43,
                  fontFamily: 'Poppins-ExtraBold',
                  color: Colors.white
                ),
                ),
                Text("Take Pictures on\nYour Every Journey", 
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins-Light',
                  color: Colors.white
                ),
                ),
                SizedBox(height: 150),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 55,
                      width: 180,
                      child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 211, 162, 147),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                              ),
                            ),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                            }, 
                            child: Text("Login",
                            style: TextStyle(
                              fontFamily: 'Poppins-Regular',
                              fontSize: 18,
                            )),
                          ),
                    ),
                        SizedBox(
                          height: 55,
                          width: 180,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 218, 218, 218),
                              elevation: 0,
                              // side: BorderSide(width: 1, color: Colors.orangeAccent),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                              )
                            ),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
                            }, 
                            child: Text("Register",
                            style: TextStyle(
                              fontFamily: 'Poppins-Regular',
                              fontSize: 18,
                              color: Color.fromARGB(255, 45, 182, 163),
                            )
                            ),
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