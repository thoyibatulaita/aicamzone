import 'package:aicamzone/aicamzone.dart';
import 'package:aicamzone/aicamzone_service.dart';
import 'package:aicamzone/login.dart';
import 'package:aicamzone/user.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {  
  final User user;
  const Profile({super.key, required this.user});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();

  @override
  void initState(){
    controllerUsername.text = widget.user.username;
    controllerEmail.text = widget.user.email;
    controllerPhone.text = widget.user.telfon;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 156, 208, 201),
      body:
      FutureBuilder<List<Aicamzone>>(
        future: AicamzoneService.getDataAicamzone(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
              } else {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                return Column(
                    children: [
                    Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                      color: Color.fromARGB(255, 46, 158, 149),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/image/ellipse.png"),
                              fit: BoxFit.fill
                            ),
                          ),
                          height: 100,
                          width: 150,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset("assets/image/profile.png",
                            height: 100,
                            width:  100,
                          ),
                        ),
                        SizedBox(height: 10),
                        Center(child: Text(widget.user.username, style: TextStyle(fontSize: 24))),
                      ],
                    ),
                    ),
                    SizedBox(height: 70),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          TextField(
                            controller: controllerEmail,
                            enabled: false,
                    style: const TextStyle(
                      fontFamily: 'Poppins-Medium',
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      enabled: false,
                      disabledBorder: OutlineInputBorder(
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
                  SizedBox(height: 20),
                    TextField(
                      controller: controllerUsername,
                            enabled: false,
                      style: const TextStyle(
                        fontFamily: 'Poppins-Medium',
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        enabled: false,
                        fillColor: Colors.white,
                        disabledBorder: OutlineInputBorder(
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
                    SizedBox(height: 20),
                    TextField(
                      controller: controllerPhone,
                            enabled: false,
                      style: const TextStyle(
                        fontFamily: 'Poppins-Medium',
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        disabledBorder: OutlineInputBorder(
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
                    SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                      },
                      child: const Text("Log Out",
                          style: TextStyle(
                            fontFamily: 'Roboto-Bold',
                            fontSize: 24,
                          )),
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 46, 158, 149),
                          minimumSize: const Size.fromHeight(55),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                         ),  
                        ],
                      ),
                    )
                    ]
                  
                );
              }
            }
          }
        ),
      );
    }
  }