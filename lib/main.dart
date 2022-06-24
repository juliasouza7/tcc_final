import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste1/inner_screens/marcas_rail_widget.dart';
import 'package:teste1/screens/carrinho.dart';
import 'package:teste1/screens/feed.dart';
import 'package:teste1/screens/home.dart';
import 'package:teste1/screens/lista_usuario.dart';
import 'consts/theme_data.dart';
import 'inner_screens/marcas_navigation_rail.dart';
import 'inner_screens/feed_categorias.dart';
import 'inner_screens/detalhes_produtos.dart';
import 'provider/carrinho_provider.dart';
import 'provider/tema_escuro_provider.dart';
import 'provider/favoritos_provider.dart';
import 'provider/produtos2.dart';
import 'screens/bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
    await themeChangeProvider.darkThemePreferences.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) {
            return themeChangeProvider;
          }),
          ChangeNotifierProvider(
            create: (_) => Products(),
          ),
          ChangeNotifierProvider(
            create: (_) => CartProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => FavsProvider(),
          ),
        ],
        child:
        Consumer<DarkThemeProvider>(builder: (context, themeData, child) {
          return MaterialApp(
            title: 'Easier Order',
            debugShowCheckedModeBanner: false,
            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            home: BottomBarScreen(),
            //initialRoute: '/',
            routes: {
              //   '/': (ctx) => LandingPage(),
              BrandNavigationRailScreen.routeName: (ctx) => BrandNavigationRailScreen(),
              BrandNavigationRailScreen.routeName: (ctx) => BrandNavigationRailScreen(),
              Carrinho.routeName: (ctx) => Carrinho(),
              Feed.routeName: (ctx) => Feed(),
              WishlistScreen.routeName: (ctx) => WishlistScreen(),
              ProductDetails.routeName: (ctx) => ProductDetails(),
              CategoriesFeedsScreen.routeName: (ctx) => CategoriesFeedsScreen(),
            },
          );
        }));
  }
}


