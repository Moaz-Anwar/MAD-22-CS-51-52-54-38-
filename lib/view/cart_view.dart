
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicine_delivery/constants/color_constant.dart';
import 'package:medicine_delivery/utils/utils.dart';
import 'package:medicine_delivery/widgets/round_button.dart';

import '../constants/app_strings.dart';
import '../constants/app_style.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;



    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: Text(
            AppString.cart,
            style: AppStyle.profile25w700(),
          ),
        ),
        body: Column(
          children: [
            // Product List Section
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildCartCards(screenWidth, context,
                          'assets/images/tanlum.png', 'Tantum Verde Spray for Local Use, 30 ml',
                          '285 ₽'),
                      SizedBox(height: 15,),
                      _buildCartCards(screenWidth, context,
                          'assets/images/compeed.png', 'Compeed Blister Patches, 5 pcs',
                          '340 ₽'),
                      SizedBox(height: 15,),
                      _buildCartCards(screenWidth, context,
                          'assets/images/nurofen.png', 'Nurofen Kids Suspension, 230 ml',
                          '230 ₽'),
                      SizedBox(height: 15,),
                      _buildCartCards(screenWidth, context,
                          'assets/images/arpelu.png', 'Arpeflu Tablets, 100mg, 30 pcs',
                          '160 ₽'),

                    ],
                  ),
                ),
              ),
            ),

            // Place Order Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: RoundButton(title: 'Place Order', onPress: () {
                Utils().toastMessage(context, 'Your Order has been placed');
              },),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartCards(double screenWidth,BuildContext context,
      String imagePath,String title,String company){
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: screenWidth * 0.2, // Adjust width based on screen
              height: screenWidth * 0.2, // Adjust height based on screen
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: screenWidth * 0.045, // Scaled font size
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'In Stock',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: screenWidth * 0.04, // Scaled font size
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    company,
                    style: TextStyle(
                      fontSize: screenWidth * 0.045, // Scaled font size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){
                  Utils().toastMessage(context, 'Added to Favourites');
                },
                    icon: Icon(Icons.favorite_outline)),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                      },
                      icon: Icon(Icons.remove,),
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(ColorConstant.buttonOrTextColorZinc.withOpacity(0.4))),
                      visualDensity: VisualDensity.compact,
                    ),
                    Text('1', style: TextStyle(fontSize: 16)),
                    IconButton(
                      onPressed: () {
                      },
                      icon: Icon(Icons.add),
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(ColorConstant.buttonOrTextColorZinc)),
                      visualDensity: VisualDensity.compact,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


  // Widget _buildSummaryRow(String title, String value, double screenWidth,
  //     {bool isBold = false}) {
  //   return Padding(
  //       padding: const EdgeInsets.symmetric(vertical: 4.0),
  //       child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text(
  //               title,
  //               style: TextStyle(
  //                 fontSize: screenWidth * 0.045,
  //                 fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
  //               ),
  //             ),
  //             Text(
  //               value,
  //               style: TextStyle(
  //                 fontSize: screenWidth * 0.045,
  //                 fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
  //               ),
  //             ),
  //           ],
  //           ),
  //       );
  //   }
}
