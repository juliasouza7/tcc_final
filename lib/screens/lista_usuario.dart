
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/favoritos_provider.dart';
import '../services/global_method.dart';
import '../widget/lista_desejos_vazia.dart';
import '../widget/lista_desejos_full.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/WishlistScreen';
  @override
  Widget build(BuildContext context) {
    GlobalMethods globalMethods =GlobalMethods();
    final favsProvider =Provider.of<FavsProvider>(context);
    return favsProvider.getFavsItems.isEmpty
        ? Scaffold(body: WishlistEmpty())
        : Scaffold(
            appBar: AppBar(
              title: Text('Lista de desejos (${favsProvider.getFavsItems.length})'),
              actions: [
                IconButton(
                  onPressed: () {
                    globalMethods.showDialogg(
                        'Clear wishlist!',
                        'Your wishlist will be cleared!',
                            () => favsProvider
                            .clearFavs(),context);
                    // cartProvider.clearCart();
                  },
                  icon: Icon(CupertinoIcons.trash),
                )
              ],
            ),
            body: ListView.builder(
              itemCount: favsProvider.getFavsItems.length,
              itemBuilder: (BuildContext ctx, int index) {
                return ChangeNotifierProvider.value(
                    value: favsProvider.getFavsItems.values.toList()[index],
                    child: WishlistFull(
                      productId: favsProvider.getFavsItems.keys.toList()[index],
                    ));
              },
            ),
          );
  }
}
