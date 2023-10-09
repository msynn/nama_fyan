import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(140.0),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/background.jpeg',
                ), // Ganti dengan path gambar latar belakang Anda
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
          ),
          title: Container(
            height: 100,
            color: Colors.transparent,
            padding: EdgeInsets.only(top: 30),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 0, 22),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/1.JPG'),
                      radius: 0,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 66, 66, 66),
                      ),
                    ),
                    Text('Fyan Ramadhan',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        )),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40.0),
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 350,
                    height: 40,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey, // Shadow color
                          offset:
                              Offset(2, 2), // Horizontal and vertical offset
                          blurRadius: 3, // Spread of the shadow
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.search),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Cari...',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Image.asset('assets/icon/pengaturan.png',
                              width: 24, height: 24),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 18),
                ],
              ),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(40),
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          TextRekomendasi(),
          Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0), child: BookList()),
          Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: KategoriScrolling()),
          // Add other content here as needed
        ],
      ),
    );
  }
}

class TextRekomendasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(25, 30, 10, 5),
      alignment: Alignment.centerLeft, // Menjadikan teks sebelah kiri
      child: Text(
        "Rekomendasi Buku",
        style: TextStyle(
          fontSize: 24, // Ukuran font 24
          fontWeight: FontWeight.bold, // Tebal (bold)
        ),
      ),
    );
  }
}

class KategoriScrolling extends StatelessWidget {
  final List<String> kategoriList = [
    "Kategori 1",
    "Kategori 2",
    "Kategori 3",
    "Kategori 4",
    "Kategori 5",
    "Kategori 6"
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Padding(
          padding: EdgeInsets.all(5),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                  ),
                  onPressed: () {},
                  child: Text(kategoriList[index]),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 10.0,
                );
              },
              itemCount: kategoriList.length)),
    );
  }
}

class BookContainer extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String author;

  BookContainer(
      {required this.imageUrl, required this.title, required this.author});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 20, 20),
      width: 180,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ClipRect(
                // Tambahkan ClipRect di sini
                child: Container(
                  padding: EdgeInsets.all(8),
                  color: Color.fromARGB(255, 58, 58, 58).withOpacity(0.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "by $author",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      // Tambahkan konten di sini jika perlu
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300, // Tinggi kontainer buku
      child: ListView(
        scrollDirection:
            Axis.horizontal, // Mengatur scrolling menjadi horizontal
        children: [
          BookContainer(
            imageUrl: 'assets/images/book1.jpeg',
            title: 'Book 1',
            author: 'Author 1',
          ),
          BookContainer(
            imageUrl: 'assets/images/book2.jpg',
            title: 'Book 2',
            author: 'Author 2',
          ),
          BookContainer(
            imageUrl: 'assets/images/book3.png',
            title: 'Book 3',
            author: 'Author 3',
          ),
          BookContainer(
            imageUrl: 'assets/images/book4.jpg',
            title: 'Book 4',
            author: 'Author 4',
          ),
          // Tambahkan BookContainer sesuai kebutuhan
        ],
      ),
    );
  }
}
