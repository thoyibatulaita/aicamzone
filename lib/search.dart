import 'package:aicamzone/aicamzone.dart';
import 'package:aicamzone/aicamzone_service.dart';
import 'package:aicamzone/spesifikasi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Aicamzone> _aicamzone = [];
  List<Aicamzone> _aicamzoneDisplay = [];

  bool isLoading = true;

  @override
  void initState() {
    AicamzoneService.getDataAicamzone().then((value) {
      setState(() {
        isLoading = false;
        _aicamzone.addAll(value);
        _aicamzoneDisplay = _aicamzone;
      });
    });
    super.initState();
  }

  _listItem(index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Spesifikasi(aicamzone: Aicamzone(id: _aicamzoneDisplay[index].id, nama_barang: _aicamzoneDisplay[index].nama_barang, deskripsi: _aicamzoneDisplay[index].deskripsi, harga: _aicamzoneDisplay[index].harga, img_url: _aicamzoneDisplay[index].img_url, isBookmark: _aicamzoneDisplay[index].isBookmark))));
      },
      child: AicamzoneCard(
        nama_barang: _aicamzoneDisplay[index].nama_barang,
        harga: _aicamzoneDisplay[index].harga,
        imageUrl: _aicamzoneDisplay[index].img_url,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  if (!isLoading) {
                    return index == 0 ? _searchField() : _listItem(index - 1);
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
                itemCount: _aicamzoneDisplay.length + 1,
              )
            ],
          ),
        ),
      ),
    );
  }

  _searchField(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: TextField(
                  controller: null,
                  onChanged: (text) {
                    text = text.toLowerCase();
                    setState(() {
                      _aicamzoneDisplay = _aicamzone.where((aicamzone) {
                        var recipeTitle = aicamzone.nama_barang.toLowerCase();
                        return recipeTitle.contains(text);
                      }).toList();
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    hintText: "Search",
                    hintStyle: TextStyle(
                      fontFamily: 'Poppins Light',
                    ),
                  ),
              ),
    );
  }
}

class AicamzoneCard extends StatelessWidget {
  final String imageUrl, nama_barang, harga;
  const AicamzoneCard(
      {Key? key,
      required this.imageUrl,
      required this.nama_barang,
      required this.harga})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Card(
        color: Color.fromARGB(255, 218, 218, 218),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                borderRadius: BorderRadius.circular(8),
                elevation: 3,
                child: Container(
                  height: 170,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12),
              Text(
                nama_barang,
                style: TextStyle(
                  fontFamily: 'OpenSans-SemiBold',
                  fontSize: 16,
                  color: Color.fromARGB(255, 71, 71, 71),
                ),
              ),
              SizedBox(height: 2),
              Text(
                harga,
                style: TextStyle(
                  fontFamily: 'OpenSans-Regular',
                  fontSize: 14,
                  color: Color.fromARGB(255, 45, 182, 163),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}