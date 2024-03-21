// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class ProductSearchPage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const ProductSearchPage({Key? key});

  @override
  _ProductSearchPageState createState() => _ProductSearchPageState();
}

class _ProductSearchPageState extends State<ProductSearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> allProducts = [
    {
      'name': 'Bunga Tulip',
      'image':
          'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcS5fZ1vi4rhaq2cItygk0TPxi7tmcoFEZaSnMOFDJ1zt1BBosjI',
      'promo': 'Diskon 20%',
    },
    {
      'name': 'Bunga Tulip Ungu',
      'image':
          'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSMLAGH2YgXD4q0-hZDDqBwFOvbGwvMSmT2TxS-UOGMzjCNTNxw',
      'promo': 'Beli 1 Gratis 1',
    },
    {
      'name': 'Bunga Mawar',
      'image':
          'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTJEgav2y_-ZZ2cTuWtglVs9F5mcUbgHqnuZhnsm7B7sHTABoa4',
      'promo': 'Hemat 30K',
    },
    {
      'name': 'Bunga Mawar',
      'image':
          'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQMt1Xg9tiEgRdioLzMzkALVvcJ1TI_IyVJbUzZZPkH2CmLCpfg',
      'promo': 'Diskon Spesial',
    },
    {
      'name': 'Bunga Gypsophila',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3d4sj1gA2O8U-YcYVlFE5YsoTRpCg5knF-Cj-oNnmFssaSAEN',
      'promo': 'Beli 2 Gratis 1',
    },
  ];
  List<Map<String, String>> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    filteredProducts = allProducts;
  }

  void _filterProducts(String value) {
    setState(() {
      filteredProducts = allProducts
          .where((product) =>
              product['name']!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    const searchLabelText = 'Cari Bunga...';
    const searchIcon = Icon(Icons.search);
    const placeholderImage =
        'https://via.placeholder.com/150'; 
    const defaultImageHeight = 200.0; 
    const animationDuration = Duration(milliseconds: 200);
    const curve = Curves.easeInOut;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pencarian Produk'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: searchLabelText,
                suffixIcon: searchIcon,
              ),
              onChanged: _filterProducts,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                return AnimatedContainer(
                  duration: animationDuration,
                  height: defaultImageHeight,
                  curve: curve,
                  child: Card(
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Image.network(
                          filteredProducts[index]['image'] ?? placeholderImage,
                          width: double.infinity,
                          fit: BoxFit.fitWidth, // Menyesuaikan lebar gambar sesuai lebar layar
                        ),
                        Container(
                          color: Colors.black.withOpacity(0.5),
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            filteredProducts[index]['name']!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
