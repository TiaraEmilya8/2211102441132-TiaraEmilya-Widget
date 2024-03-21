// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Commerce'),
      ),
      body: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return const SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 500,
                        height: 400, // Ganti tinggi gambar menjadi 400
                        child: Image(
                          image: NetworkImage('https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRWRNQbM4exY0vq4LaUSpWiI5QZMJFpexHq30MAetBoyGy7ubH8'),
                        ),
                      ),
                    ),
                    ListProducts(),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 500,
                        height: 400, // Ganti tinggi gambar menjadi 400
                        child: Image(
                          image: NetworkImage('https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQ6-VJyhYWHMR5Znxprl2c5zu-deYVBuB_paIFC646rQLeYKaHz'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ListProducts extends StatelessWidget {
  const ListProducts({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ProductImage(
              key: UniqueKey(),
              rndSeed: 1,
              nama: "1. Bunga Tulip",
              harga: 165.000,
              imageUrls: const [
                'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTZwNgpnRigEZs7YPKnc6k-SHxojOZpRL7rCqzRn3ofUwk2j1gz',
                'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTZwNgpnRigEZs7YPKnc6k-SHxojOZpRL7rCqzRn3ofUwk2j1gz',
                'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTZwNgpnRigEZs7YPKnc6k-SHxojOZpRL7rCqzRn3ofUwk2j1gz_',
              ],
            ),
            ProductImage(
              key: UniqueKey(),
              rndSeed: 2,
              nama: "2. Bunga Mawar",
              harga: 120.000,
              imageUrls: const [
                'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTJEgav2y_-ZZ2cTuWtglVs9F5mcUbgHqnuZhnsm7B7sHTABoa4',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYIIoejiZe-KoLNsj47Fup-bZL9EKSqqiO1Jqey4atuhHsIxFp',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9JPUk5WzZ12kXBKItWZbmDPjEgnzu-A_IqBExcCiNbPrM9jap',
              ],
            ),
            ProductImage(
              key: UniqueKey(),
              rndSeed: 3,
              nama: "3. Bunga Gypsophila",
              harga: 140.000,
              imageUrls: const [
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3d4sj1gA2O8U-YcYVlFE5YsoTRpCg5knF-Cj-oNnmFssaSAEN',
                'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTKe1g41eFDq8YB41yVFW8dvnEOzAMcd9ol38of0dmrNE3sLvX6',
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYj1qVxGJtvMxocoPr6195sQo-P44rkXR472-tn2z549CO7ESN',
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  final int rndSeed;
  final String nama;
  final double harga;
  final List<String> imageUrls;

  const ProductImage({
    required Key key,
    this.rndSeed = 2,
    this.nama = "Parfum",
    this.harga = 125000,
    required this.imageUrls,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Image(
            width: 300, 
            height: 200,
            image: NetworkImage(imageUrls[rndSeed - 1]), 
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(nama, style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          Text("Rp. ${harga.toStringAsFixed(3)}"),
        ],
      ),
    );
  }
}
