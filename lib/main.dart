import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product Navigation',
      home: ProductListPage(),
    );
  }
}

class Product {
  final String name;
  final String description;
  final int price;
  final Color color;

  Product({
    required this.name,
    required this.description,
    required this.price,
    required this.color,
  });
}

class ProductListPage extends StatelessWidget {
  final List<Product> products = [
    Product(
        name: 'pixel 1',
        description: 'Pixel is the most featureful phone ever',
        price: 800,
        color: const Color.fromARGB(255, 5, 93, 165)),
    Product(
        name: 'laptop',
        description: 'Laptop is the most productive development tool',
        price: 2000,
        color: const Color.fromARGB(255, 57, 214, 62)),
    Product(
        name: 'tablet',
        description: 'Tablet is the most useful device ever for meeting',
        price: 1500,
        color: const Color.fromARGB(255, 212, 195, 39)),
    Product(
        name: 'pen Drive',
        description: 'Pendrive is the most stylish device ever',
        price: 100,
        color: const Color.fromARGB(255, 235, 94, 13)),
    Product(
        name: 'Floppy Drive',
        description: 'Floppy Drive is the most nostalgic device ever',
        price: 50,
        color: const Color.fromARGB(198, 48, 206, 158)),
  ];

  ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Product Navigation', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsPage(product: product),
                  ),
                );
              },
              child: Row(
                children: [
                  Container(
                    width: 250,
                    height: 150,
                    decoration: BoxDecoration(
                      color: product.color,
                      borderRadius:
                          BorderRadius.horizontal(left: Radius.circular(12)),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      product.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                          Text(product.description),
                          SizedBox(height: 5),
                          Text('Price: \$${product.price}',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 5),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(
                              3,
                              (starIndex) => Icon(
                                product.name == 'tablet'
                                    ? Icons.star
                                    : Icons.star_outline,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
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

class ProductDetailsPage extends StatefulWidget {
  final Product product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  _ProductDetailsPageState createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  List<bool> isStarFilled = [
    false,
    true,
    false
  ]; // Track the state of each star

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.name, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              color: widget.product.color,
              // borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            alignment: Alignment.center,
            child: Text(
              widget.product.name.toLowerCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.name,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text(
                      widget.product.description,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Price: \$${widget.product.price}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 25),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 16, bottom: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(
                            3,
                            (starIndex) => Icon(
                              widget.product.name == 'tablet'
                                  ? Icons.star
                                  : Icons.star_outline,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
