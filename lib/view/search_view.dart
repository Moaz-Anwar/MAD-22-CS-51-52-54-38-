import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _medicines = [];
  bool _isLoading = false;

  // Function to fetch medicines by name
  Future<void> _searchMedicines(String name) async {
    setState(() {
      _isLoading = true;
    });

    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('medicines')
          .where('name', isGreaterThanOrEqualTo: name)
          .where('name', isLessThanOrEqualTo: '$name\uf8ff')
          .get();

      setState(() {
        _medicines = querySnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
      });
    } catch (e) {
      print('Error fetching medicines: $e');
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 3),
            ],
          ),
          child: Center(
            child: Row(
              children: [
                const Icon(Icons.search, color: Colors.orangeAccent),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search for medicines',
                      border: InputBorder.none,
                      suffixIcon: TextButton(
                        child: const Text('SEARCH',style: TextStyle(color: Colors.cyan),),
                        onPressed: () {
                          _searchMedicines(_searchController.text.trim());
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _isLoading
                  ? const CircularProgressIndicator()
                  : Expanded(
                child: _medicines.isEmpty
                    ? const Center(child: Text('No medicines found'))
                    : ListView.builder(
                  itemCount: _medicines.length,
                  itemBuilder: (context, index) {
                    final medicine = _medicines[index];
                    return MedicineCard(medicine: medicine);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Medicine Card Widget
class MedicineCard extends StatelessWidget {
  final Map<String, dynamic> medicine;

  const MedicineCard({Key? key, required this.medicine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${medicine['name']}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text('Category: ${medicine['category']}'),
            const SizedBox(height: 4),
            Text('Company: ${medicine['company']}'),
            const SizedBox(height: 4),
            Text('Description: ${medicine['description']}'),
          ],
        ),
      ),
    );
  }
}
