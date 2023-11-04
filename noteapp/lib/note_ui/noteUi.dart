import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:noteapp/model/product_listModel.dart';
import 'package:noteapp/services.dart/product_services.dart';

class NoteUi extends StatefulWidget {
  const NoteUi({super.key});

  @override
  State<NoteUi> createState() => _NoteUiState();
}

class _NoteUiState extends State<NoteUi> {
  int? selectedindex;
  List<int> selectedIndexList = [];

  ProductServices productServices = Get.put(ProductServices());

  bool isLoaded = false;

  List<Product>? product;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productServices.getProducts().then((value) {
      setState(() {
        isLoaded = true;
        //  print(isLoaded.toString());
      });
    });
    //getData();
  }

  // getData() async {
  //   var data = await productServices.getProducts();
  //   product = data.products;
  //   log("product $product");
  //   if (product != null) {
  //     setState(() {
  //       isLoaded = true;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Note Ui')),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                height: 40,
                width: 50,
                child: Image.asset("assets/download.jpeg"),
              ),
              Expanded(
                child: Visibility(
                  visible: isLoaded,
                  replacement: Center(
                    child: CircularProgressIndicator(),
                  ),
                  child: ListView.builder(
                      padding: EdgeInsets.only(top: 15),
                      itemCount: productServices.productsList.length,
                      itemBuilder: (context, index) {
                        print(productServices.productsList.length);
                        return Container(
                            decoration: BoxDecoration(
                                color: Colors.indigo.shade400.withOpacity(.5),
                                borderRadius: BorderRadius.circular(10)),
                            margin: EdgeInsets.only(
                              left: 10,
                              right: 10,
                              bottom: 10,
                            ),
                            child: Obx(() {
                              return ListTile(
                                onTap: () {
                                  selectedindex = index;
                                  selectedIndexList.add(selectedindex!);
                                  print(
                                      "selected index is :- $index and $selectedindex and list is $selectedIndexList ");
                                },
                                leading: Text(
                                  // "afds"
                                  productServices.productsList[index].id
                                      .toString(), //  "$index",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black),
                                ),
                                title: Text(
                                  productServices.productsList[index].title,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                                subtitle: Text(
                                  productServices
                                      .productsList[index].description,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                ),
                                trailing: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    selectedindex == index
                                        ? Icon(
                                            Icons.done,
                                            size: 25,
                                            color: Colors.green,
                                          )
                                        : Icon(
                                            Icons.done,
                                            size: 25,
                                          ),
                                    Text(
                                      productServices.productsList[index].rating
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                  ],
                                ),
                              );
                            }));
                      }),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "createNote");
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => CreateNoteUi()));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
