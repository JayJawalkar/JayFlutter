import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  final Map<String, Object> product;

  const ProductDetail({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int selectedSize = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(widget.product['title'] as String,
              style: Theme.of(context).textTheme.titleLarge),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(widget.product['imageURl'] as String),
          ),
          const Spacer(
            flex: 2,
          ),
          Container(
            width: double.infinity,
            height: 250,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(245, 247, 249, 1),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(40),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '\$${widget.product['price']}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 55,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List<int>).length,
                    itemBuilder: (context, index) {
                      final size =
                          (widget.product['sizes'] as List<int>)[index];

                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = size;
                            });
                          },
                          child: Chip(
                            label: Text(
                              size.toString(),
                            ),
                            backgroundColor: selectedSize == size
                                ? Theme.of(context).colorScheme.primary
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  
                  child: ElevatedButton(
                    
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      
                    ),
                    
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
