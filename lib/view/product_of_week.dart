
import 'package:flutter/material.dart';
import 'package:medicine_delivery/utils/utils.dart';
import 'package:medicine_delivery/widgets/round_button.dart';

import '../constants/app_strings.dart';
import '../constants/app_style.dart';
import '../constants/color_constant.dart';

class ProductOfWeek extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          'Product of Week',
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
                    // Product Card
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/arpelu.png',
                              width: screenWidth * 0.2, // Adjust width based on screen
                              height: screenWidth * 0.2, // Adjust height based on screen
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Tantum Verde Spray for Local Use, 30ml',
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
                                    '285 ₽',
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
                                IconButton(onPressed: (){
                                  Utils().toastMessage(context, 'Added to Cart');
                                },
                                    icon: Icon(Icons.shopping_cart_outlined)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Promocode Section
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Promocode',
                          style: TextStyle(fontSize: screenWidth * 0.045),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Enter Promocode',
                            style: TextStyle(fontSize: screenWidth * 0.04),
                          ),
                        ),
                      ],
                    ),

                    // Summary Section
                    SizedBox(height: 20),
                    Divider(),
                    _buildSummaryRow('Total', '285.00 ₽', screenWidth),
                    _buildSummaryRow('Discount by Promocode', '0', screenWidth),
                    _buildSummaryRow('Delivery', '0', screenWidth),
                    Divider(),
                    _buildSummaryRow('Total', '285.00 ₽',
                        screenWidth, isBold: true),
                  ],
                ),
              ),
            ),
          ),

          // Place Order Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RoundButton(title: 'Place Order', onPress: () {
              Utils().toastMessage(context, 'Your Order For this Medicine\nHas been Placed');
            },),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String title, String value, double screenWidth,
      {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: screenWidth * 0.045,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: screenWidth * 0.045,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
