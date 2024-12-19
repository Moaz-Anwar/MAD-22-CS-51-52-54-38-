import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {

  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  final List<Map<String, String>> products = [
    {
      'title': 'Nurofen Kids Suspension 230 ml',
      'price': '131 ₽',
      'oldPrice': '356 ₽',
      'image': 'https://via.placeholder.com/100',
    },
    {
      'title': 'Compeed Blister Patches, 5 pcs',
      'price': '320 ₽',
      'image': 'https://via.placeholder.com/100',
    },
  ];

  final List<Map<String, String>> suggestions = [
    {
      'title': 'Arpeflu Tablets, 100 mg, 30 pcs',
      'price': '341 ₽',
      'image': 'https://via.placeholder.com/100',
    },
    {
      'title': 'Tantum Verde Spray, 30 ml',
      'price': '285 ₽',
      'image': 'https://via.placeholder.com/100',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: _buildSearchBar(),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopMenu(),
            _buildSectionTitle("Deals of the Day"),
            _buildHorizontalProductList(products),
            _buildSectionTitle("Promotions"),
            _buildPromotionBanner(),
            _buildSectionTitle("You Recently Searched"),
            _buildHorizontalProductList(suggestions),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 3),
        ],
      ),
      child: Row(
        children: const [
          Icon(Icons.search, color: Colors.orangeAccent),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for medicines and products',
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopMenu() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _TopMenuItem(icon: Icons.chat, label: 'Chat with\nPharmacist'),
          _TopMenuItem(icon: Icons.map, label: 'Pharmacy\nMap'),
          _TopMenuItem(icon: Icons.delivery_dining, label: 'Delivery'),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildHorizontalProductList(List<Map<String, String>> items) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final product = items[index];
          return _ProductCard(
            title: product['title']!,
            price: product['price']!,
            oldPrice: product['oldPrice'],
            imageUrl: product['image']!,
          );
        },
      ),
    );
  }

  Widget _buildPromotionBanner() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.pink[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Text(
            'Product of the Week',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class _TopMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _TopMenuItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.cyan[50],
          child: Icon(icon, color: Colors.cyan, size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

class _ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String? oldPrice;
  final String imageUrl;

  const _ProductCard({
    required this.title,
    required this.price,
    this.oldPrice,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 3)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(imageUrl, height: 80, width: double.infinity, fit: BoxFit.cover),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontSize: 12)),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
              Row(
                children: const [
                  Icon(Icons.remove_circle_outline, color: Colors.grey),
                  SizedBox(width: 4),
                  Icon(Icons.add_circle_outline, color: Colors.blue),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
