import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_fast/style/style.dart';

import '../components/image_network.dart';
import '../model/product_model.dart';

class ProductDetail extends StatefulWidget {
  final ProductModel? product;
  const ProductDetail({super.key, required this.product});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  bool isLike = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.bgDetailProduct,
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Style.white,
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(
                      MediaQuery.of(context).size.width, 100.0)),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: (() {
                          Navigator.pop(context);
                        }),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Color(0xff777777),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: IconButton(
                          onPressed: (() {}),
                          icon: Icon(
                            Icons.shopping_cart_checkout_outlined,
                            color: Color(0xff777777),
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomImageNetwork(
                    width: 260,
                    height: 260,
                    image: widget.product?.image,
                  ),
                  10.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: GestureDetector(
                          onTap: () {
                            isLike = !isLike;
                            setState(() {});
                          },
                          child: Container(
                            height: 50.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isLike ? Color(0x50777777) : Colors.red),
                            child: Icon(
                              Icons.favorite,
                              color: isLike ? Colors.red : Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          15.verticalSpace,
          Padding(
            padding: const EdgeInsets.only(left: 29),
            child: Text(
              widget.product?.title ?? "",
              style: Style.textStyleofTitle(size: 28),
            ),
          )
        ],
      ),
    );
  }
}
