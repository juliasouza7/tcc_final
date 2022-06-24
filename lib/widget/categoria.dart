import 'package:flutter/material.dart';

import '../inner_screens/feed_categorias.dart';

class CategoryWidget extends StatefulWidget {
  CategoryWidget({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

//class CategoryWidget extends StatelessWidget {
 // late int index;

  //static final List<Map<String, dynamic>> categories = [

  class _CategoryWidgetState extends State<CategoryWidget> {
    static final List<Map<String, dynamic>> categories = [
    {
      'categoryName': 'Japonesa',
      'categoryImagesPath': 'assets/imagens/japonesa.jpg',
    },
    {
      'categoryName': 'Lanches',
      'categoryImagesPath': 'assets/imagens/fastfood.jpg',
    },
    {
      'categoryName': 'Saudável',
      'categoryImagesPath': 'assets/imagens/saudavel.jpg',
    },
    {
      'categoryName': 'Pizza',
      'categoryImagesPath': 'assets/imagens/pizza.jpg',
    },
    {
      'categoryName': 'Massas',
      'categoryImagesPath': 'assets/imagens/massas.jpg',
    },
    {
      'categoryName': 'Petiscos',
      'categoryImagesPath': 'assets/imagens/petisco.jpg',
    },
    {
      'categoryName': 'Bebidas',
      'categoryImagesPath': 'assets/imagens/bebidas.jpg',
    },
  ];

  //get index => null;

  //CategoryWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: (){
            Navigator.of(context).pushNamed(CategoriesFeedsScreen.routeName, arguments: '${categories[widget.index]['categoryName']}');

          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage(categories[widget.index]['categoryImagesPath']),
                  fit: BoxFit.cover),
            ),
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: 150,
            height: 150,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 10,
          right: 10,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            color: Theme.of(context).backgroundColor,
            child: Text(
              categories[widget.index]['categoryName'],
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18,
                color: Theme.of(context).textSelectionColor,
              ),
            ),
          ),
        )
      ],
    );
  }
  }

