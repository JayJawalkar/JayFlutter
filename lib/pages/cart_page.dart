import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_ecommerce/providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Cart')),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final cartItem = cart[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage(cartItem['imageURl'] as String),
            ),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          "Delete Item",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'No',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Provider.of<CartProvider>(context, listen: false)
                                  .removeProduct(cartItem);
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Yes',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      );
                    });
              },
              icon: const Icon(Icons.delete_outline_sharp, color: Colors.red),
            ),
            title: Text(
              cartItem['title'].toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Size: ${cartItem['size']}'),
          );
        },
      ),
    );
  }
}
