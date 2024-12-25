import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/app_strings.dart';
import '../constants/app_style.dart';
import '../constants/color_constant.dart';
import '../utils/utils.dart';
import '../widgets/round_button.dart';

class MedicineDetailScreen extends StatelessWidget {
  final Map<String, dynamic> medicineData = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: false,
        title: Text(
          AppString.details,
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
                              medicineData['medicineImage'],
                              width: screenWidth * 0.2, // Adjust width based on screen
                              height: screenWidth * 0.2, // Adjust height based on screen
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    medicineData['medicineName'],
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
                                    medicineData['medicineCompany'],
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
                          onPressed: () {
                            Utils().toastMessage(context, 'YOU ARE NOT ELIGIBLE');
                          },
                          child: Text(
                            'Enter Promocode',
                            style: TextStyle(fontSize: screenWidth * 0.04),
                          ),
                        ),
                      ],
                    ),

                    _buildSummaryRow('Category', medicineData['medicineCategory'], screenWidth,
                    isBold: true),
                    SizedBox(height: 10),
                    Divider(),
                    _buildSummaryRow('Total', medicineData['medicinePrice'], screenWidth),
                    _buildSummaryRow('Discount by Promocode', '0', screenWidth),
                    _buildSummaryRow('Delivery', '0', screenWidth),
                    Divider(),
                    _buildSummaryRow('Total', medicineData['medicinePrice'],
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
