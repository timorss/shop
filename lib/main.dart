import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/products_overview_screen.dart';
import './screens/product_details_screen.dart';
import './screens/cart_screen.dart';
import './providers/products.dart';
import './providers/cart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Products()),
          ChangeNotifierProvider(create: (_) => Cart()),
        ],
        child: MaterialApp(
          title: 'My Shop',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            canvasColor: Color.fromRGBO(255, 254, 229, 1),
            fontFamily: 'Lato',
          ),
          home: ProductOverviewScreen(),
          routes: {
            ProductDetailsScreen.routeName: (ctx) => ProductDetailsScreen(),
            CartScreen.routeName: (ctx) => CartScreen(),
          },
          // onGenerateRoute: (settings) {
          //   print(settings.arguments);
          //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
          // },
          // onUnknownRoute: (settings) {
          //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
          // },
        ));
  }
}
