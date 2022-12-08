import 'package:aicamzone/aicamzone.dart';
import 'package:aicamzone/aicamzone_service.dart';
import 'package:aicamzone/bookmark.dart';
import 'package:aicamzone/profil.dart';
import 'package:aicamzone/search.dart';
import 'package:aicamzone/spesifikasi.dart';
import 'package:aicamzone/user.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final User user;
  const Home({super.key, required this.user});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> 
  with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  bool isLoading = true;
  List<Aicamzone> _aicamzone = [];
  List<Aicamzone> _aicamzoneDisplay = [];

  @override
  void initState() {
    AicamzoneService.getDataAicamzone().then((value) => {
      setState(() {
        isLoading = false;
        _aicamzone.addAll(value);
        _aicamzoneDisplay = _aicamzone;
      })
    });
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  int currentIndex = 0;

  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
      List pages = [
      HomeBody(),
      Bookmark(),
      Search(),
      Profile(user: widget.user),
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Color.fromARGB(255, 45, 182, 163),
        unselectedItemColor: Colors.grey,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_outlined),
              label: 'Bookmark'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              label: 'Seacrh'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile'),
        ],
      ),
      body: pages.elementAt(currentIndex)
    );
  }
}

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  bool isBookmark = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50,),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: GestureDetector(
              //     onTap: (() {
              //       Navigator.push(context, MaterialPageRoute(builder: (context)=>Search()));
              //     }),
              //     child: Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              //       child: Icon(Icons.search, size: 30, color: Colors.green,),
              //     ),
              //   ),
              // ),
              FutureBuilder<List<Aicamzone>>(
                    future: AicamzoneService.getDataAicamzone(),
                    builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: snapshot.data?.length,
                      padding: EdgeInsets.all(5),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Spesifikasi(aicamzone: Aicamzone(id: int.parse("${snapshot.data?[index].id}"), nama_barang: "${snapshot.data?[index].nama_barang}", deskripsi: "${snapshot.data?[index].deskripsi}", img_url: "${snapshot.data?[index].img_url}", harga: "${snapshot.data?[index].harga}", isBookmark: snapshot.data?[index].isBookmark as bool),)));
                          },
                          child: Card(
                            color: Color.fromARGB(255, 218, 218, 218),
                            elevation: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                                "${snapshot.data?[index].img_url}"),
                                          )),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${snapshot.data?[index].nama_barang}",
                                              style: TextStyle(
                                                color: Color.fromARGB(255, 71, 71, 71),
                                                fontFamily: 'Poppins-SemiBold',
                                              ),
                                            ),
                                            SizedBox(height: 2),
                                            Text(
                                              "${snapshot.data?[index].harga}",
                                              style: TextStyle(
                                                color: Color.fromARGB(255, 45, 182, 163),
                                                fontFamily: 'Poppins-SemiBold',
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Icon(Icons.bookmark,size: 30, color: Colors.grey,)
                                      // GestureDetector(
                                      //   onTap: (){
                                      //     setState(() {
                                      //       isBookmark = !isBookmark;
                                      //     });
                                      //   },
                                      //   child: Icon(Icons.bookmark, color: isBookmark == false ? Colors.grey : Color.fromARGB(255, 45, 182, 163),))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      );
  }
}