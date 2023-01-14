import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/product_model.dart';
import '../style/style.dart';
import 'image_network.dart';

class HorizontalProduct extends StatefulWidget {
  final ProductModel? product;

  HorizontalProduct({Key? key, required this.product}) : super(key: key);

  @override
  State<HorizontalProduct> createState() => _HorizontalProductState();
}

class _HorizontalProductState extends State<HorizontalProduct> {
  bool isLike = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Style.bgOfproductsContainer),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 17),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: CustomImageNetwork(
                image: widget.product?.image,
              ),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, left: 10, top: 20),
                  child: Text(
                    widget.product?.title ?? "",
                    style: Style.textStyleofTitle(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      ('\$ ${widget.product?.price ?? 0}').toString(),
                      style: Style.textStyleofPrice(),
                    ),
                    IconButton(
                        onPressed: (() {}),
                        icon: Icon(
                          Icons.add_circle_outline,
                          color: Style.colorOfPrice,
                          size: 30,
                        ))
                  ],
                ),
              ],
            )),
            Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: GestureDetector(
                onTap: () {
                  isLike = !isLike;
                  setState(() {});
                },
                child: Container(
                  height: 21.h,
                  width: 21.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isLike ? Colors.white : Colors.red),
                  child: Icon(
                    Icons.favorite,
                    color: isLike ? Colors.red : Colors.white,
                    size: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
