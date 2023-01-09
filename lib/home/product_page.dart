import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grow_fast/home/productDetailPage.dart';

import '../components/gridview_products.dart';
import '../components/horizontal_products.dart';
import '../model/product_model.dart';
import '../repository/get_info.dart';
import '../style/style.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<ProductModel?>? lifOfProduct = [];
  List<dynamic>? lifOfCategory = [];
  bool isLoading = true;
  bool isHorizontal = true;

  @override
  void initState() {
    getInformation();
    super.initState();
  }

  getInformation() async {
    isLoading = true;
    lifOfProduct = await GetInfo.getProduct();
    lifOfCategory = await GetInfo.getCategory();
    isLoading = false;
    setState(() {});
  }

  getProduct() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        scrolledUnderElevation: 50,
        backgroundColor: Color(0xffF1F4F3),
        title: Text(
          "Products",
          style: GoogleFonts.raleway(color: Colors.black),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 24),
                        shrinkWrap: true,
                        itemCount: lifOfCategory?.length ?? 0,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                              margin: const EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Style.bgCategory),
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                  child: Text(lifOfCategory?[index] ?? '')));
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "All Products",
                          style: Style.textStyleofTitle(size: 20),
                        ),
                        IconButton(
                            onPressed: () {
                              isHorizontal = !isHorizontal;
                              setState(() {});
                            },
                            icon: Icon(
                              isHorizontal
                                  ? Icons.grid_view_outlined
                                  : Icons.list,
                              color: Color(0xff194B38),
                            ))
                      ],
                    ),
                  ),
                  isHorizontal
                      ? ListView.builder(
                          padding: EdgeInsets.only(top: 23),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: lifOfProduct?.length ?? 0,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => ProductDetail(
                                        product: lifOfProduct?[index]))));
                              },
                              child: HorizontalProduct(
                                  product: lifOfProduct?[index]),
                            );
                          },
                        )
                      : GridView.builder(
                          padding: EdgeInsets.only(top: 20),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: lifOfProduct?.length ?? 0,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            mainAxisSpacing: 18,
                            crossAxisSpacing: 17,
                            maxCrossAxisExtent: 300,
                            mainAxisExtent: 280,
                          ),
                          itemBuilder: (context, index) => GridProduct(
                                product: lifOfProduct?[index],
                              )),
                ],
              ),
            ),
    );
  }
}
