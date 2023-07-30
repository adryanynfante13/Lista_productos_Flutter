import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LISTADO DE PRODUCTOS',
      home: ProductoLista(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProductoLista extends StatefulWidget {
  @override
  _ProductListScreen createState() => _ProductListScreen();
}

List<Product> _products = [
  Product(
      nombre: 'Mangos.',
      cantidad: '200 Unidades',
      precio: '1200',
      urlImage:
          "https://upload.wikimedia.org/wikipedia/commons/4/49/Mango_-_single.jpg"),
  Product(
      nombre: 'Fresas.',
      cantidad: '2500 Unidades',
      precio: '300',
      urlImage:
          "https://upload.wikimedia.org/wikipedia/commons/6/63/Fresas_1.JPG"),
  Product(
      nombre: 'Manzana Roja.',
      cantidad: '200 Unidades',
      precio: '1500',
      urlImage:
          "https://upload.wikimedia.org/wikipedia/commons/c/c1/Fuji_apple.jpg"),
  Product(
      nombre: 'Kiwi.',
      cantidad: '2000 Unidades',
      precio: '990',
      urlImage:
          "https://upload.wikimedia.org/wikipedia/commons/b/b8/Kiwi_%28Actinidia_chinensis%29_1_Luc_Viatour.jpg"),
  Product(
      nombre: 'Sandia.',
      cantidad: '100 Unidades',
      precio: '16900',
      urlImage:
          "https://upload.wikimedia.org/wikipedia/commons/4/40/Watermelons.jpg"),
  Product(
      nombre: 'Manzana Verde.',
      cantidad: '100 Unidades',
      precio: '2200',
      urlImage:
          "https://upload.wikimedia.org/wikipedia/commons/c/c8/Manzana-verde-hojas.jpg"),
];

class _ProductListScreen extends State<ProductoLista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true, title: Text('LISTADO DE PRODUCTOS'), actions: []),
      body: ListView.builder(
        itemCount: _products.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProductDetailScreen(product: _products[index]),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(12),
              margin: const EdgeInsets.all(12),
              height: 100,
              width: double.infinity,
              color: Color.fromARGB(255, 161, 161, 161),
              child: Row(
                children: [
                  Image.network(
                    _products[index].urlImage,
                    height: 60,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _products[index].nombre,
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          _products[index].cantidad,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$${_products[index].precio.toString()}',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.nombre),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              product.urlImage,
              height: 230,
              width: 230,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 18),
            Text(
              product.cantidad,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 16),
            Text(
              '\$ ${product.precio.toString()}',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

class Product {
  final String nombre;
  final String cantidad;
  final String precio;
  final String urlImage;
  Product(
      {required this.nombre,
      required this.cantidad,
      required this.precio,
      required this.urlImage});
}
