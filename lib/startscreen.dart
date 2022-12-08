import 'package:aicamzone/landing.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Landing()));
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/image/bglanding.png"), 
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: <Widget>[
                SizedBox(height: 60),
                Text("AiCAME", style: TextStyle(
                  fontSize: 64,
                  fontFamily: 'Poppins-Bold',
                  color: Colors.black
                ),),
                // SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text("ZONE", style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'Poppins-Bold',
                    color: Colors.black
                  ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}