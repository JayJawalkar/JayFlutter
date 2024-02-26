import 'package:flutter/material.dart';
import 'package:shop_ecommerce/global_variable.dart';
import 'package:shop_ecommerce/widgets/product_card.dart';
import 'package:shop_ecommerce/pages/product_details.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const ['All', 'Nike', 'Addidas', 'Red Tape'];
  late String selected;
  @override
  void initState() {
    super.initState();
    selected = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  ' Shoes\n Collection',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(50),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              itemCount: filters.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = filter;
                      });
                    },
                    child: Chip(
                      backgroundColor: selected == filter
                          ? Theme.of(context).colorScheme.primary
                          : const Color.fromRGBO(225, 225, 225, 1),
                      side: const BorderSide(
                        color: Color.fromRGBO(225, 225, 225, 1),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      label: Text(filter),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: size.width > 1080
                ? GridView.builder(
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.75,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return ProductDetail(product: product);
                              },
                            ),
                          );
                        },
                        child: ProductCard(
                          title: product['title'] as String,
                          price: product['price'] as double,
                          image: product['imageURl'] as String,
                          backGoundColor: index.isEven
                              ? const Color.fromRGBO(216, 243, 253, 1)
                              : const Color.fromRGBO(245, 247, 249, 1),
                        ),
                      );
                    },
                  )
                : ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return ProductDetail(product: product);
                              },
                            ),
                          );
                        },
                        child: ProductCard(
                          title: product['title'] as String,
                          price: product['price'] as double,
                          image: product['imageURl'] as String,
                          backGoundColor: index.isEven
                              ? const Color.fromRGBO(216, 243, 253, 1)
                              : const Color.fromRGBO(245, 247, 249, 1),
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
