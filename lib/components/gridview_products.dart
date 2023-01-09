import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grow_fast/style/style.dart';

import '../model/product_model.dart';
import 'image_network.dart';

class GridProduct extends StatefulWidget {
  final ProductModel? product;
  const GridProduct({super.key, required this.product});

  @override
  State<GridProduct> createState() => _GridProductState();
}

class _GridProductState extends State<GridProduct> {
  bool isLike = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 245.h,
      width: 149.w,
      decoration: BoxDecoration(
          color: Style.bgOfproductsContainer,
          borderRadius: BorderRadius.all(Radius.circular(28))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          17.verticalSpace,
          Padding(
            padding: const EdgeInsets.only(left: 150),
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
          10.verticalSpace,
          CustomImageNetwork(
            width: 160,
            image: widget.product?.image,
          ),
          8.verticalSpace,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 17),
              child: Text(
                widget.product?.title ?? "",
                style: Style.textStyleofTitle(size: 14),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 17),
                child: Text(
                  ('\$ ${widget.product?.price ?? 0}').toString(),
                  style: Style.textStyleofPrice(size: 18),
                ),
              ),
              Spacer(),
              Container(
                width: 53.w,
                height: 41.h,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Color(0xff26AD71), Color(0xff32CB4B)]),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
