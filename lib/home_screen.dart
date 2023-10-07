import 'package:flutter/material.dart';
import 'package:module_9_assignment/product_Brain.dart';
import 'package:sizer/sizer.dart';
import 'reusable_container.dart';
ProductBrain productBrain=ProductBrain();
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int totalAmount = 0;

  void updateAmount(int value) {
    setState(() {
      totalAmount += value;
    });
  }
  void snackBar(){
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Congratulation!!!Have a good day :)"),
          duration: Duration(seconds: 3),

        )
    );
  }

  void deleteAmounts(int value) {
    setState(() {
      totalAmount -= value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        actions: const  [
          Icon(
            Icons.search_rounded,
            color: Colors.black87,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 11),
            child: Text(
              'My Bag',
              style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
              flex: 5,
              child: ListView.builder(
                  itemCount: productBrain.productDetails.length,
                  itemBuilder: (context, index) {
                    return ReusableContainer(
                      productName: productBrain.productDetails[index].pName,
                      productColor: productBrain.productDetails[index].pColor,
                      productSize: productBrain.productDetails[index].pSize,
                      productPrice: productBrain.productDetails[index].pPrice,
                      productImage: productBrain.productDetails[index].pImage,
                      updateTotalAmount: updateAmount,
                      deleteAmount: deleteAmounts,
                    );
                  })),
          Expanded(
              flex: 1,
              child: SizedBox(
                //height: 100,
                // color: Colors.grey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total amount:',
                            style: TextStyle(
                                fontSize: 20, color: Colors.grey.shade600),
                          ),
                          Text('$totalAmount\$',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600))
                        ],
                      ),
                    ),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: GestureDetector(
                          onTap: snackBar,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(25)
                            ),
                            child: Center(
                              child: Text('CHECK OUT',style: TextStyle(color: Colors.white,fontSize: 12.sp),),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
