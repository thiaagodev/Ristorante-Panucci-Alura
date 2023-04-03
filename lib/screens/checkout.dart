import 'package:flutter/material.dart';
import 'package:panucci_ristorante/cardapio.dart';
import 'package:panucci_ristorante/components/order_item.dart';
import 'package:panucci_ristorante/components/payment_method.dart';
import 'package:panucci_ristorante/components/payment_total.dart';

import '../components/main_drawer.dart';

class Checkout extends StatelessWidget {
  final List items = pedido;

  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ristorante Panucci"),
        backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(
              Icons.account_circle,
              size: 32,
            ),
          )
        ],
        centerTitle: true,
      ),
      drawer: const MainDrawer(),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CustomScrollView(
            slivers: <Widget>[
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Pedido',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  ((context, index) {
                    return OrderItem(
                      imageURI: items[index]['image'],
                      itemPrice: items[index]['price'],
                      itemTitle: items[index]['name'],
                    );
                  }),
                  childCount: items.length,
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8.0, top: 8.0),
                  child: Text(
                    'Pagamento',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: PaymentMethod(),
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8.0, top: 8.0),
                  child: Text(
                    'Confirmar',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: PaymentTotal(),
                ),
              )
            ],
          )),
    );
  }
}
