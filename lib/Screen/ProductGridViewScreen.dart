import 'package:crud_app/RestAPI/RestClient.dart';
import 'package:crud_app/Screen/ProductCreateScreen.dart';
import 'package:crud_app/Screen/ProductUpdateScreen.dart';
import 'package:crud_app/Style/ColorStyle.dart';
import 'package:crud_app/Style/ProductGridViewStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../Style/background.dart';

class ProductGridViewScreen extends StatefulWidget {
  const ProductGridViewScreen({super.key});

  @override
  State<ProductGridViewScreen> createState() => _ProductGridViewScreenState();
}

class _ProductGridViewScreenState extends State<ProductGridViewScreen> {
  List ProductList = [];
  bool Loading = true;

  @override
  void initState() {
    callData();
    super.initState();
  }

  callData() async {
    Loading = true;
    var data = await ProductGirldViewListRequst();
    setState(() {
      ProductList = data;
      Loading = false;
    });
  }

  DeleteItem(id) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Delete!"),
            content: const Text("Once delete, you can't get it Back"),
            actions: [
              OutlinedButton(
                  onPressed: () async {
                    Navigator.pop(context);
                    setState(() {
                      Loading = true;
                    });
                    await ProductDeleteRequest(id);
                    await callData();
                  },
                  child: const Text("Yes")),
              OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("No"))
            ],
          );
        });
  }

  GoToUpdate(context, productItem) {
    Navigator.push(context,
        MaterialPageRoute(builder: (builder) => ProductUpdateScreen(productItem)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Product List")),
      body: Stack(
        children: [
          ScreenBackGround(context),
          Container(
            child: Loading
                ? (const Center(
                    child: CircularProgressIndicator(),
                  ))
                : RefreshIndicator(
                    child: (GridView.builder(
                        gridDelegate: ProductGridViewStyle(),
                        itemCount: ProductList.length,
                        itemBuilder: (contex, index) {
                          return Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                    child: Image.network(
                                  ProductList[index]["Img"],
                                  fit: BoxFit.fill,
                                )),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 5, 5, 2),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ProductList[index]["ProductName"],
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                          "${"Price: " + ProductList[index]["UnitPrice"]} BDT"),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          OutlinedButton(
                                              onPressed: () {
                                                GoToUpdate(context,ProductList[index]);
                                              },
                                              child: const Icon(
                                                CupertinoIcons
                                                    .ellipsis_vertical_circle,
                                                color: colorGreen,
                                                size: 20,
                                              )),
                                          const SizedBox(
                                            width: 3,
                                          ),
                                          OutlinedButton(
                                              onPressed: () {
                                                DeleteItem(
                                                    ProductList[index]["_id"]);
                                              },
                                              child: const Icon(
                                                CupertinoIcons.delete,
                                                color: colorRed,
                                                size: 18,
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        })),
                    onRefresh: () async {
                      await callData();
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (builder) => ProductCreateScreen()));
        },
        child: Icon(CupertinoIcons.add),
      ),
    );
  }
}
