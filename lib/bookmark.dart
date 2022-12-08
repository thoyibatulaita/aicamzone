import 'package:aicamzone/aicamzone.dart';
import 'package:aicamzone/aicamzone_service.dart';
import 'package:aicamzone/spesifikasi.dart';
import 'package:flutter/material.dart';

class Bookmark extends StatelessWidget {
  const Bookmark({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 202, 200, 200),
        title: const Text(
          "Bookmark",
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
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: FutureBuilder<List<Aicamzone>>(
                    future: AicamzoneService.getDataAicamzoneBookmark(),
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
                      padding: EdgeInsets.all(10),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Card(
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
                                SizedBox(height: 10),
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
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }
                      );
                    }
                  }
                },
              ),
        ),
      ),
    );
  }
}