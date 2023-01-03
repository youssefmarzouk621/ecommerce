import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/config/statics.dart';

import 'package:flutter_ecommerce_app/src/model/product.dart';
import 'package:flutter_ecommerce_app/src/pages/product_detail.dart';
import 'package:flutter_ecommerce_app/src/themes/light_color.dart';
import 'package:flutter_ecommerce_app/src/widgets/title_text.dart';
import 'package:flutter_ecommerce_app/src/widgets/extentions.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({Key key, this.product}) : super(key: key);

//   @override
//   _ProductCardState createState() => _ProductCardState();
// }

// class _ProductCardState extends State<ProductCard> {
//   Product product;
//   @override
//   void initState() {
//     product = widget.product;
//     super.initState();
//   }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: LightColor.background,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(color: Color(0xfff8f8f8), blurRadius: 15, spreadRadius: 10),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              left: 0,
              top: 0,
              child: IconButton(
                icon: Icon(
                  Icons.favorite_border,
                  color:
                      LightColor.iconColor,
                ),
                onPressed: () {},
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(height: 0),
                Expanded(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: LightColor.orange.withAlpha(40),
                      ),
                      Image.network(baseURLUploads+product.images[0])
                    ],
                  ),
                ),
                // SizedBox(height: 5),
                TitleText(
                  text: product.name,
                  fontSize: 14,
                ),
                TitleText(
                  text: product.category.name,
                  fontSize: 12,
                  color: LightColor.orange,
                ),
                TitleText(
                  text: product.price.toString(),
                  fontSize: 16,
                ),
              ],
            ),
          ],
        ),
      ).ripple(() {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductDetailPage(product:product)));
      }, borderRadius: BorderRadius.all(Radius.circular(20))),
    );
  }
}
