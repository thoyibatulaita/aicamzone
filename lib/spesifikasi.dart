import 'package:aicamzone/aicamzone.dart';
import 'package:aicamzone/aicamzone_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Spesifikasi extends StatefulWidget {
  final Aicamzone aicamzone;
  const Spesifikasi({super.key, required this.aicamzone});

  @override
  State<Spesifikasi> createState() => _SpesifikasiState();
}

class _SpesifikasiState extends State<Spesifikasi> {
  bool isBookmark = false;

  @override
  void initState(){
    isBookmark = widget.aicamzone.isBookmark;
    super.initState();
  }

  void addBookmark(bool isBookmark) async {
      try {
        var response = await Dio().put('http://192.168.100.199:3000/data/' + widget.aicamzone.id.toString(),
            data: {"nama_barang": widget.aicamzone.nama_barang, "img_url": widget.aicamzone.img_url, "deskripsi": widget.aicamzone.deskripsi, "harga": widget.aicamzone.harga, "isBookmark": isBookmark});
        if (response.data.length > 0) {
          print("Bookmark added successfully");
        }
        else{
          print("Failed");
        }
      } catch (e) {
        print(e);
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 202, 200, 200),
        title: const Text(
          "Spesifikasi",
          style: TextStyle(color:Color.fromARGB(255, 45, 182, 163),
          fontFamily: 'Roboto-Bold',
          fontSize: 24,
          ),
        ),
        leading: IconButton(
            icon: const Icon(Icons.keyboard_arrow_left, size: 40,
                color: Color.fromARGB(255, 45, 182, 163)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
      ),
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
                          SizedBox(height: 10),
                          Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(widget.aicamzone.img_url),
                                fit: BoxFit.cover,
                              )
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(widget.aicamzone.nama_barang,
                            style: TextStyle(
                              color: Color.fromARGB(255, 107, 107, 107),
                              fontFamily: 'Poppins-SemiBold',
                              fontSize: 24,)
                          ),
                          Text(widget.aicamzone.harga,
                             style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontFamily: 'Poppins-SemiBold',
                                fontSize: 18,)
                          ),
                          SizedBox(height: 5),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(20),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                                color: Color.fromARGB(255, 218, 218, 218),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: IconButton(
                                      onPressed: (){
                                        setState(() {
                                          isBookmark = !isBookmark;
                                          addBookmark(isBookmark);
                                        });
                                      },
                                      icon: Icon(Icons.bookmark, size: 50, color: isBookmark == false ? Colors.white : Color.fromARGB(255, 46, 158, 149),),
                                    ),
                                  ),
                                  // SizedBox(height: 10),
                                  Text(widget.aicamzone.deskripsi, textAlign: TextAlign.justify,
                                    style: TextStyle(
                                    color: Color.fromARGB(255, 107, 107, 107),
                                    fontFamily: 'Poppins-SemiBold',
                                    fontSize: 13,)
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    }
                  }
                },
              ),
    );
  }
}