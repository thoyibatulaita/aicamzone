import 'package:aicamzone/aicamzone_service.dart';
import 'package:aicamzone/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  final User user;
  const EditProfile({super.key, required this.user});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerUser = TextEditingController();
  TextEditingController controllerTelp = TextEditingController();
  TextEditingController controllerPass = TextEditingController();

  @override
  void initState() {
    controllerEmail.text = widget.user.email;
    controllerUser.text = widget.user.username;
    controllerTelp.text = widget.user.telfon;
    controllerPass.text = widget.user.password;
    super.initState();
  }

  void changePassword(String email, username, telfon, password) async {
    try {
      var response = await Dio().put(
          'http://192.168.100.199:3000/users/' + widget.user.id.toString(),
          data: {
            "email": email, "username": username, "telfon": telfon, "password": password
          });
      if (response.data.length > 0) {
        print("Account updated successfully");
        Navigator.pop(context);
      } else {
        print("Failed");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 45, 182, 163),
        title: Text(
          "Edite Profile",
          style: TextStyle(
              fontFamily: 'OpenSans-Bold',
              color: Color.fromARGB(255, 255, 252, 252),
              fontSize: 18),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Icon(
              Icons.keyboard_arrow_left,
              color: Color.fromARGB(255, 255, 255, 255),
              size: 30,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<User>>(
          future: AicamzoneService.getDataUserId(widget.user.id.toString()),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return Container(
                  height: double.infinity,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
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
                      SizedBox(height: 85),
                      ElevatedButton(
                        onPressed: () {
                            changePassword(controllerEmail.text, controllerUser.text, controllerTelp.text, controllerPass.text);
                        },
                        child: Text(
                          "Edit",
                          style: TextStyle(
                              fontFamily: 'OpenSans-SemiBold',
                              color: Color(0xFFFFFFFF),
                              fontSize: 15),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 45, 182, 163),
                            elevation: 0,
                            minimumSize: const Size.fromHeight(53),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                    ],
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }
}