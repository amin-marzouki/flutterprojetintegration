import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:projetIntegration/models/user_model.dart';
import 'package:projetIntegration/providers/auth_provider.dart';
import 'package:projetIntegration/providers/product_provider.dart';
import 'package:projetIntegration/theme.dart';

import 'package:projetIntegration/widgets/products_tile.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    const kTextColor = Color(0xFF535353);
    const kTextLightColor = Color(0xFFACACAC);

    const kDefaultPaddin = 20.0;
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, ${user.name}',
                    style: primaryTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                  ),
                  Text(
                    '${user.name}',
                    style: subtitleTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget newArrivals() {
      return Container(
        margin: EdgeInsets.only(top: 14),
        child: Column(
          children: productProvider.products
              .map((product) => ProductTile(product))
              .toList(),
        ),
      );
    }

    return ListView(
      children: [
        header(),
        /*   categories(),
        */
        newArrivals(),
      ],
    );
  }
}
