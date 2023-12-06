import 'package:crud_app/RestAPI/RestClient.dart';
import 'package:crud_app/Screen/ProductCreateScreen.dart';
import 'package:crud_app/Screen/ProductGridViewScreen.dart';
import 'package:crud_app/Style/Button.dart';
import 'package:crud_app/Style/TextFieldStyle.dart';
import 'package:crud_app/Style/background.dart';
import 'package:crud_app/Utility/Toast.dart';
import 'package:flutter/material.dart';

class ProductUpdateScreen extends StatefulWidget {
  final Map productItem;

  const ProductUpdateScreen(this.productItem);

  @override
  State<ProductUpdateScreen> createState() => _ProductUpdateScreenState();
}

class _ProductUpdateScreenState extends State<ProductUpdateScreen> {
  Map<String, String> FormValues = {
    "Img": "",
    "ProductCode": "",
    "ProductName": "",
    "Qty": "",
    "TotalPrice": "",
    "UnitPrice": "",
  };
  bool Loading = false;

  void initState() {
    setState(() {
      FormValues.update(
          "ProductName", (value) => widget.productItem["ProductName"]);
      FormValues.update("Img", (value) => widget.productItem["Img"]);
      FormValues.update(
          "ProductCode", (value) => widget.productItem["ProductCode"]);
      FormValues.update("Qty", (value) => widget.productItem["Qty"]);
      FormValues.update(
          "TotalPrice", (value) => widget.productItem["TotalPrice"]);
      FormValues.update(
          "UnitPrice", (value) => widget.productItem["UnitPrice"]);
    });
  }

  InputOnChange(MapKey, TextValue) {
    setState(() {
      FormValues.update(MapKey, (value) => TextValue);
    });
  }

  FormOnSubmit() async {
    if (FormValues['Img']!.length == 0) {
      ErrorToast('Image Link Required');
    } else if (FormValues['ProductCode']!.length == 0) {
      ErrorToast('Enter A Product Code');
    } else if (FormValues['ProductName']!.length == 0) {
      ErrorToast('Enter A Product Name');
    } else if (FormValues['Qty']!.length == 0) {
      ErrorToast('Enter Product Qty');
    } else if (FormValues['TotalPrice']!.length == 0) {
      ErrorToast('Enter Product Total Price');
    } else if (FormValues['UnitPrice']!.length == 0) {
      ErrorToast('Enter Product Unit Price');
    } else {
      setState(() {
        Loading = true;
      });
      await ProductUpdateBody(FormValues, widget.productItem["_id"]);
      setState(() {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => ProductGridViewScreen()),
            (route) => false);
        
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Update Product")),
      body: Stack(
        children: [
          ScreenBackGround(context),
          Container(
            child: Loading
                ? (const Center(
                    child: CircularProgressIndicator(),
                  ))
                : ((SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        TextFormField(
                          initialValue: FormValues["ProductName"],
                          onChanged: (TextValue) {
                            InputOnChange("ProductName", TextValue);
                          },
                          decoration: AppInputDecoretion("Product Name"),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          initialValue: FormValues["ProductCode"],
                          onChanged: (TextValue) {
                            InputOnChange("ProductCode", TextValue);
                          },
                          decoration: AppInputDecoretion("Product Code"),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          initialValue: FormValues["Img"],
                          onChanged: (TextValue) {
                            InputOnChange("Img", TextValue);
                          },
                          decoration: AppInputDecoretion("Product Image"),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          initialValue: FormValues["UnitPrice"],
                          onChanged: (TextValue) {
                            InputOnChange("UnitPrice", TextValue);
                          },
                          decoration: AppInputDecoretion("Per Unit Price"),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          initialValue: FormValues["TotalPrice"],
                          onChanged: (TextValue) {
                            InputOnChange("TotalPrice", TextValue);
                          },
                          decoration: AppInputDecoretion("Total Price"),
                        ),
                        const SizedBox(height: 20),
                        AppDropDownStyle(
                          DropdownButton(
                            value: FormValues['Qty'],
                            items: const [
                              DropdownMenuItem(
                                value: "",
                                child: Text('Select Qty'),
                              ),
                              DropdownMenuItem(
                                value: "1 pcs",
                                child: Text('1 pcs'),
                              ),
                              DropdownMenuItem(
                                value: "2 pcs",
                                child: Text('2 pcs'),
                              ),
                              DropdownMenuItem(
                                value: "3 pcs",
                                child: Text('3 pcs'),
                              ),
                              DropdownMenuItem(
                                value: "4 pcs",
                                child: Text('4 pcs'),
                              ),
                              DropdownMenuItem(
                                value: "5 pcs",
                                child: Text('5 pcs'),
                              ),
                              DropdownMenuItem(
                                value: "6 pcs",
                                child: Text('6 pcs'),
                              ),
                            ],
                            onChanged: (TextValue) {
                              InputOnChange("Qty", TextValue);
                            },
                            underline: Container(),
                            isExpanded: true,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                            child: ElevatedButton(
                                style: AppButtonStyle(),
                                onPressed: () {
                                  setState(() {
                                    FormOnSubmit();
                                  });
                                },
                                child: SuccessButtonChild("Submit")))
                      ],
                    ),
                  ))),
          )
        ],
      ),
    );
  }
}
