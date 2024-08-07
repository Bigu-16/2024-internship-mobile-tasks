import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:product_app/models/products.dart';
import 'package:product_app/update_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Upload Image Example')),
        body: const Parent(),
      ),
    );
  }
}

class Parent extends StatefulWidget {
  const Parent({super.key});

  @override
  State<Parent> createState() => _ParentState();
}

class _ParentState extends State<Parent> {
  bool showUploadImage = false;

  void toggleUploadImage() {
    print('tapped');
    setState(() {
      showUploadImage = !showUploadImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: UpdatePage(onButtonPressed: toggleUploadImage),
        ),
        if (showUploadImage) 
          Expanded(
            child: UploadImage(onButtonPressed: toggleUploadImage,),
          ),
      ],
    );
  }
}

class UpdatePage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final VoidCallback onButtonPressed;

  UpdatePage({super.key, required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 30,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
          color: const Color.fromRGBO(63, 81, 243, 1),
        ),
        title: const Text(
          'Add Product',
          style: TextStyle(fontSize: 15),
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: GestureDetector(
            onTap: onButtonPressed,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Container(
                    width: 400,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 243, 242, 242),
                    ),
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.broken_image_outlined,
                            size: 40,
                          ),
                          SizedBox(height: 15),
                          Text('Upload Image')
                        ],
                      ),
                    ),
                  ),
                
                SizedBox(height: 6),
                Text('Name'),
                SizedBox(height: 6),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 243, 242, 242),
                      borderRadius: BorderRadius.circular(4)),
                  child: TextField(
                    
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                const Text('Category'),
                const SizedBox(height: 6),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 243, 242, 242),
                      borderRadius: BorderRadius.circular(4)),
                  child: TextField(
                    controller: categoryController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                const Text('Price'),
                const SizedBox(height: 6),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 243, 242, 242),
                      borderRadius: BorderRadius.circular(4)),
                  child: TextField(
                    controller: priceController,
                    keyboardType: const TextInputType.numberWithOptions(signed: false),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.attach_money,
                          size: 20,
                        )),
                  ),
                ),
                const SizedBox(height: 6),
                const Text('Description'),
                const SizedBox(height: 6),
                Container(
                  height: 140,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 243, 242, 242),
                      borderRadius: BorderRadius.circular(4)),
                  child: TextField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(500, 45),
                    backgroundColor: const Color.fromRGBO(63, 81, 243, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  onPressed: () {
                    final updatedProduct = Product(
                      name: nameController.text,
                      category: categoryController.text,
                      price: double.tryParse(priceController.text) ?? 0,
                      description: descriptionController.text, 
                      id: 1,
                      rating:4,
                    );
                    Navigator.pop(context, updatedProduct);
                  },
                  child: const Text(
                    'ADD',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 12),
                OutlinedButton(
                  onPressed: () {
                    debugPrint('Delete pressed');
                  },
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.red),
                      minimumSize: const Size(500, 45),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4))),
                  child: const Text(
                    'Delete',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
        
              ],
            ),
          ),
        ),
      ),
      
    );
    
  }
}

class UploadImage extends StatefulWidget {
  final VoidCallback onButtonPressed;

  const UploadImage({super.key, required this.onButtonPressed});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  File? _image;
  final picker = ImagePicker();

  Future getImageGallery() async {
    final pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        print('No image picked');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                if (_image != null)
                  Image.file(_image!),
                ElevatedButton(
                  onPressed: getImageGallery,
                  child: const Text('Pick Image from Gallery'),
                ),
              ],
            ),
          ),
    );
  }
}

// class Product {
//   final String name;
//   final String category;
//   final double price;
//   final String description;

//   Product({
//     required this.name,
//     required this.category,
//     required this.price,
//     required this.description,
//   });
// }
