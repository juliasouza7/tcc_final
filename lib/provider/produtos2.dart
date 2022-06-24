
import 'package:flutter/cupertino.dart';

import '../models/product.dart';

class Products with ChangeNotifier {
  List<Product> _products = [
    Product(
        id: 'Whopper Furiosaço',
        title: 'Whopper Furiosaço',
        description:
        'O Whopper Furiosaço é o mais novo lançamento do Burger King com pão vermelho, pimenta malagueta e jalapeño na composição.',
        price: 50.99,
        imageUrl:
        'https://gkpb.com.br/wp-content/uploads/2016/03/whopper-furiosaco-burger-king-foto-grelhado-fogo-blog-gkpb.jpg',
        brand: 'BK',
        productCategoryName: 'Lanches',
        quantity: 65,
        isPopular: true,
        isFavorite: false),
    Product(
        id: 'Mega Clone',
        title: 'Mega Clone',
        description:
        'Nosso clássico hambúrguer de 100g, queijo, alface americana, tomate, ovo, bacon crocante... E a única maionese Giraffas!',
        price: 50.99,
        imageUrl:
        'https://londrinando.com/uploads/gerenciador/IMG_8102_site.jpg?1558031834471',
        brand: 'Giraffas ',
        productCategoryName: 'Lanches',
        quantity: 2,
        isPopular: true,
        isFavorite: false),
    Product(
        id: 'ClubHouse',
        title: 'ClubHouse',
        description:
        'A receita leva dois burgers combinados com bacon cortado mais grosso, cheddar suave, alface crespa, tomate, cebola caramelizada e o mesmo molho especial do Big Mac em um pão tipo brioche',
        price: 50.99,
        imageUrl:
        'https://www.beefpoint.com.br/wp-content/uploads/2020/01/e41ccfc9e0373ba2ce843bba2e185793.jpg',
        brand: 'McDonalds',
        productCategoryName: 'Lanches',
        quantity: 4,
        isPopular: true,
        isFavorite: false),
    Product(
        id: 'Grand Cheddar McMelt',
        title: 'Grand Cheddar McMelt',
        description:
        'Um hambúrguer (100% carne bovina), molho sabor cheddar, cebola ao molho shoyu e pão escuro com gergelim.',
        price: 29.99,
        imageUrl:
        'https://classic.exame.com/wp-content/uploads/2016/09/size_960_16_9_cheddar-mc-donalds4.jpg?quality=70&strip=info&w=960',
        brand: 'McDonalds',
        productCategoryName: 'Lanches',
        quantity: 3,
        isPopular: true,
        isFavorite: false),
    Product(
        id: 'Whopper Furiosaço',
        title: 'Whopper Furiosaço',
        description:
        'O Whopper Furiosaço é o mais novo lançamento do Burger King com pão vermelho, pimenta malagueta e jalapeño na composição.',
        price: 50.99,
        imageUrl:
        'https://gkpb.com.br/wp-content/uploads/2016/03/whopper-furiosaco-burger-king-foto-grelhado-fogo-blog-gkpb.jpg',
        brand: 'BK',
        productCategoryName: 'Lanches',
        quantity: 65,
        isPopular: true,
        isFavorite: false),
    Product(
        id: 'Mega Clone',
        title: 'Mega Clone',
        description:
        'Nosso clássico hambúrguer de 100g, queijo, alface americana, tomate, ovo, bacon crocante... E a única maionese Giraffas!',
        price: 50.99,
        imageUrl:
        'https://londrinando.com/uploads/gerenciador/IMG_8102_site.jpg?1558031834471',
        brand: 'Giraffas ',
        productCategoryName: 'Lanches',
        quantity: 12,
        isPopular: true,
        isFavorite: false),
    Product(
        id: 'ClubHouse',
        title: 'ClubHouse',
        description:
        'A receita leva dois burgers combinados com bacon cortado mais grosso, cheddar suave, alface crespa, tomate, cebola caramelizada e o mesmo molho especial do Big Mac em um pão tipo brioche',
        price: 36.99,
        imageUrl:
        'https://www.beefpoint.com.br/wp-content/uploads/2020/01/e41ccfc9e0373ba2ce843bba2e185793.jpg',
        brand: 'McDonalds',
        productCategoryName: 'Lanches',
        quantity: 5,
        isPopular: true,
        isFavorite: false),
    Product(
        id: 'Grand Cheddar McMelt',
        title: 'Grand Cheddar McMelt',
        description:
        'Um hambúrguer (100% carne bovina), molho sabor cheddar, cebola ao molho shoyu e pão escuro com gergelim.',
        price: 42.99,
        imageUrl:
        'https://classic.exame.com/wp-content/uploads/2016/09/size_960_16_9_cheddar-mc-donalds4.jpg?quality=70&strip=info&w=960',
        brand: 'McDonalds',
        productCategoryName: 'Lanches',
        quantity: 3,
        isPopular: true,
        isFavorite: false)
  ];

  List<Product> get products {
    return [..._products];
  }

  List<Product> get popularProducts {
    return _products.where((element) => element.isPopular).toList();
  }

  Product findById(String productId) {
    return _products.firstWhere((element) => element.id == productId);
  }

  List findByCategory(String categoryName) {
    List _categoryList = _products
        .where((element) => element.productCategoryName
        .toLowerCase()
        .contains(categoryName.toLowerCase()))
        .toList();
    return _categoryList;
  }

  List findByBrand(String brandName) {
    List _categoryList = _products
        .where((element) =>
        element.brand.toLowerCase().contains(brandName.toLowerCase()))

        .toList();
    return _categoryList;
  }

  List<Product> searchQuery(String searchText) {
    List<Product> _searchList = _products
        .where(
          (element) => element.title.toLowerCase().contains(
        searchText.toLowerCase(),
      ),
    )
        .toList();
    return _searchList;
  }

}
