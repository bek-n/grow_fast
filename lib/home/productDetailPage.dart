import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/product_model.dart';


class ProductDetail extends StatefulWidget {
  final ProductModel? product;
  const ProductDetail({super.key, this.product});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            leading: Container(
              width: 60.w,
              height: 40.h,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                border: Border.all(color: const Color(0xff777777))
              ),
              child: Icon(Icons.arrow_back_ios),
            ),
          ),
    );
  }
}