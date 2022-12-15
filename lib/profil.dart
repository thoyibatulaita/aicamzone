import 'package:aicamzone/aicamzone_service.dart';
import 'package:aicamzone/edit_profile.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 156, 208, 201),
      body:
      FutureBuilder<List<User>>(
        future: AicamzoneService.getDataUserId(widget.user.id.toString()),
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
                    SizedBox(height: 50),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 54,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: [
                                  Icon(Icons.mail),
                                  SizedBox(width: 15),
                                  Text("${snapshot.data?[0].email}",
                                  style: TextStyle(
                                    fontFamily: 'Poppins-Regular',
                                    fontSize: 16,
                                  )),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            width: double.infinity,
                            height: 54,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: [
                                  Icon(Icons.person),
                                  SizedBox(width: 15),
                                  Text("${snapshot.data?[0].username}",
                                  style: TextStyle(
                                    fontFamily: 'Poppins-Regular',
                                    fontSize: 16,
                                  )),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            width: double.infinity,
                            height: 54,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: [
                                  Icon(Icons.phone),
                                  SizedBox(width: 15),
                                  Text("${snapshot.data?[0].telfon}",
                                  style: TextStyle(
                                    fontFamily: 'Poppins-Regular',
                                    fontSize: 16,
                                  )),
                                ],
                              ),
                            ),
                          ),
                  SizedBox(height: 30),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                     height: 55,
                          width: 180,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 218, 218, 218),
                              elevation: 0,
                              side: BorderSide(width: 1, color: Color.fromARGB(255, 45, 182, 163)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
                              )
                            ),
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile(user: User(id: int.parse("${snapshot.data?[0].id}"), email: "${snapshot.data?[0].email}", username: "${snapshot.data?[0].username}", telfon: "${snapshot.data?[0].telfon}", password: "${snapshot.data?[0].password}"),)));
                            }, 
                            child: Text("Edit Profile",
                            style: TextStyle(
                              fontFamily: 'Poppins-Regular',
                              fontSize: 18,
                              color: Color.fromARGB(255, 45, 182, 163),
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
                              side: BorderSide(width: 1, color: Color.fromARGB(255, 45, 182, 163)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
                              )
                            ),
                            onPressed: (){
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
                                AicamzoneService.removeProfile(widget.user.id.toString());
                                Navigator.pop(context);
                            }, 
                            child: Text("Hapus Profile",
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
                    SizedBox(height: 20),
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