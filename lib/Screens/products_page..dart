import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/products_provider.dart';
import '../Providers/category_provider.dart';
import '../Widgets/custom_product_item.dart';
import '../Screens/product_details_page.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<CategoryProvider>(
          builder: (context, categoryProvider, child) {
            var categories = categoryProvider.categoryModel?.data;
            if (categories == null) {
              categoryProvider.fetchCategories();
              return Center(child: CircularProgressIndicator());
            } else {
              return SizedBox(
                height: 50, // Adjust height as needed
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    var category = categories[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Chip(
                        label: Text(category['name']),
                        onDeleted: () {
                          // Handle category selection or deletion
                        },
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Consumer<ProductsProvider>(
          builder: (context, productsProvider, child) {
            var data = productsProvider.productModel?.data;
            if (data == null) {
              productsProvider.fetchData();
              return Center(child: CircularProgressIndicator());
            } else {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 20,
                  crossAxisCount: 2,
                ),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  var product = data[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsPage(
                            image: product['image'],
                            data: product['name'],
                            desc: product['description'],
                          ),
                        ),
                      );
                    },
                    child: CustomProductItem(
                      image: product['image'],
                      name: product['name'],
                      price: product['price'].toString(),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}