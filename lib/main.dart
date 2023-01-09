import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:projetIntegration/pages/cart_page.dart';
import 'package:projetIntegration/pages/checkout_page.dart';
import 'package:projetIntegration/pages/checkout_success_page.dart';
import 'package:projetIntegration/pages/detail_chat.dart';
import 'package:projetIntegration/pages/edit_profile_page.dart';
import 'package:projetIntegration/pages/home/main_page.dart';

import 'package:projetIntegration/pages/splash_page.dart';

import 'package:projetIntegration/pages/sign_in_page.dart';
import 'package:projetIntegration/pages/sign_up_page.dart';
import 'package:projetIntegration/providers/auth_provider.dart';
import 'package:projetIntegration/providers/cart_provider.dart';
import 'package:projetIntegration/providers/product_provider.dart';
import 'package:projetIntegration/providers/wishlist_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => MainPage(),
          '/detail-chat': (context) => DetailChatPage(),
          '/edit-profile': (context) => EditProfilePage(),
          '/cart': (context) => CartPage(),
          '/checkout': (context) => CheckoutPage(),
          '/checkout-success': (context) => CheckoutSuccessPage(),
        },
      ),
    );
  }
}
