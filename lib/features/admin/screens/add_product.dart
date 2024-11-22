import 'package:amazon/constants.dart';
import 'package:amazon/features/common/widgets/input_field.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});
  static const String routeName = '/admin/add-product';

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
    String selectedCategory = 'Mobiles';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: appBarGradient),
        ),
        title: const Text(
          'Add a product',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(10),
              dashPattern: const [10, 4],
              //  [4, 2] means a visible segment of length 4 is followed by a gap of length 2.
              // •	[5, 3, 2, 3] means:
              // •	Dash of length 5,
              // •	Gap of length 3,
              // •	Dash of length 2,
              // •	Gap of length 3, repeating.

              child: const Center(
                child: SizedBox(
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.folder_open,
                        size: 45,
                      ),
                      Text(
                        'Select image of new product',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            InputField(
                controller: nameController,
                hintText: 'Enter product name',
                maxLines: 1),
            const SizedBox(
              height: 15,
            ),
            InputField(
                controller: priceController,
                hintText: 'Enter product price',
                maxLines: 1),
            const SizedBox(
              height: 15,
            ),
            InputField(
                controller: descriptionController,
                hintText: 'Enter current stock',
                maxLines: 7),
            const SizedBox(
              height: 15,
            ),
            InputField(
              controller: stockController,
              hintText: 'Enter product name',
              maxLines: 1,
            ),
            const SizedBox(
              height: 15,
            ),
DropdownButton(
  value: selectedCategory, // Ensure null if no selection
  hint: const Text('select item category'),
  items: const [
        DropdownMenuItem(
      value: 'Mobiles', // Set the value
      child: Text('Mobiles'),
    ),

    DropdownMenuItem(
      value: 'Essentials', // Set the value
      child: Text('Essentials'),
    ),

    DropdownMenuItem(
      value: 'Appliances',
      child: Text('Appliances'),
    ),
    DropdownMenuItem(
      value: 'Books',
      child: Text('Books'),
    ),
    DropdownMenuItem(
      value: 'Fashion',
      child: Text('Fashion'),
    ),
  ],
  onChanged: (value) {
    
    setState(() {
      selectedCategory = value!; 
    });
  },
)          ],
        ),
      ),
    );
  }
}
