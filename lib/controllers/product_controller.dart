import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var subcat = <String>[].obs; // Using reactive variable

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> getSubCategories(String categoryName) async {
    try {
      // Clear existing subcategories
      subcat.clear();
      print("HELLLOOO");

      QuerySnapshot snapshot = await _firestore
          .collection('categories')
          .where('name', isEqualTo: categoryName)
          .get();

      if (snapshot.docs.isNotEmpty) {
        var categoryData = snapshot.docs.first.data() as Map<String, dynamic>;
        List<dynamic> subcategories = categoryData['subcategory']; // Use the correct field name

        //if(subcat.isEmpty) {
          subcat.addAll(List<String>.from(subcategories));
        // }
      }
    } catch (e) {
      print("Error fetching subcategories: $e");
    }
    print(subcat);
  }
}
