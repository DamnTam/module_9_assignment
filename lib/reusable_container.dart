import 'package:flutter/material.dart';
import 'package:module_9_assignment/home_screen.dart';
import 'package:sizer/sizer.dart';

class ReusableContainer extends StatefulWidget {
  const ReusableContainer({
    super.key,
    required this.productName,
    required this.productColor,
    required this.productSize,
    required this.productPrice,
    required this.productImage,
    required this.updateTotalAmount,
    required this.deleteAmount,
  });

  final String productName;
  final String productColor;
  final String productSize;
  final int productPrice;
  final String productImage;
  final void Function(int) updateTotalAmount;
  final void Function(int) deleteAmount;

  @override
  State<ReusableContainer> createState() => _ReusableContainerState();
}

class _ReusableContainerState extends State<ReusableContainer> {
  int cnt = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
            borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 150,
              width: 125,
              child: ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                  child: Image.network(widget.productImage,fit: BoxFit.fill,))),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.productName,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                SizedBox(height: 10,),
                Row(
                  children: [
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Color: ",
                              style:
                              TextStyle(color: Colors.grey.shade500)),
                          TextSpan(
                              text: widget.productColor,
                              style: const TextStyle(color: Colors.black)),
                        ])),
                    const SizedBox(
                      width: 10,
                    ),
                    RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Size: ",
                              style:
                              TextStyle(color: Colors.grey.shade500)),
                          TextSpan(
                              text:widget.productSize,
                              style: const TextStyle(color: Colors.black)),
                        ])),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Material(
                        elevation: 4.0,
                        shape: const CircleBorder(),
                        child: IconButton(
                          onPressed: () {
                            if (cnt > 0) {
                              cnt--;
                              widget.deleteAmount(widget.productPrice);
                            }

                            setState(() {});
                          },
                          icon: const Icon(Icons.remove),
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text('$cnt',style: TextStyle(fontSize: 16),),
                    const SizedBox(
                      width: 15,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Material(
                        elevation: 4.0,
                        shape: const CircleBorder(),
                        child: IconButton(
                          onPressed: () {
                            cnt++;
                            widget.updateTotalAmount(widget.productPrice);

                            setState(() {});
                          },
                          icon: const Icon(Icons.add),
                          color: Colors.grey,
                        ),
                      ),
                    )
                  ],
                ),

              ],
            ),
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.more_vert,color: Colors.grey,)),
              Padding(
                padding: const EdgeInsets.only(right: 10,bottom: 25),
                child: Text("${widget.productPrice}\$",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
              ),
            ],
          ),
        ],
      ),

    );
  }
}
