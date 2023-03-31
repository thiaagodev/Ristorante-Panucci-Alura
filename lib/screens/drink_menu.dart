import 'package:flutter/material.dart';
import 'package:panucci_ristorante/cardapio.dart';
import 'package:panucci_ristorante/components/drink_item.dart';

class DrinkMenu extends StatelessWidget {
  final List items = drinks;

  const DrinkMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      child: CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Bebidas',
                style: TextStyle(fontFamily: 'Caveat', fontSize: 32),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return DrinkItem(
                  imageURI: items[index]['image'],
                  itemTitle: items[index]['name'],
                  itemPrice: items[index]['price'],
                );
              },
              childCount: items.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
          )
        ],
      ),
    );
  }
}
