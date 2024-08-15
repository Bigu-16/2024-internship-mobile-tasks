import 'package:clean_app/features/ecommerce/domain/entities/product.dart';
import 'package:clean_app/features/ecommerce/presentation/BLoC/add_and_update/add_and_update_bloc.dart';
import 'package:clean_app/features/ecommerce/presentation/BLoC/add_and_update/add_and_update_event.dart';
import 'package:clean_app/features/ecommerce/presentation/BLoC/add_and_update/add_and_update_state.dart';
import 'package:clean_app/features/ecommerce/presentation/widgets/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart'; 

class UpdatePage extends StatefulWidget {
  final Product? product;

  const UpdatePage({this.product});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  void submitForm(BuildContext context) {
    final name = nameController.text;
    final category = categoryController.text;
    final price = double.tryParse(priceController.text) ?? 0.0;
    final description = descriptionController.text;
    final imageUrl = _imageUrl ?? '';

    // final id = widget.product != null ? widget.product!.id : Uuid().v4();

    if (widget.product != null) {
      context.read<UpdateBloc>().add(UpdateData(
            id: widget.product!.id,
            name: name,
            category: category,
            price: price,
            description: description,
            imageUrl: imageUrl,
          ));
    } else {
      context.read<AddBloc>().add(AddData(
            id: "1",
            category: category,
            name: name,
            price: price,
            description: description,
            imageUrl: imageUrl,
          ));
    }
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String? _imageUrl;

  @override
  void initState(){
    super.initState();
    if (widget.product != null){
      final product = widget.product!;
      nameController.text = product.name;
      categoryController.text = product.category;
      priceController.text = product.price.toString();
      descriptionController.text = product.description;
      _imageUrl = product.imageUrl;
    }
  }

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
          icon: Icon(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImagePicker(
                onImageSelected: (String imageUrl) {
                  setState(() {
                    _imageUrl = imageUrl;
                  });
                },
              ),
              SizedBox(height: 6),
              Text('name'),
              SizedBox(height: 6),
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 243, 242, 242),
                    borderRadius: BorderRadius.circular(4)),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 6),
              Text('category'),
              SizedBox(height: 6),
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 243, 242, 242),
                    borderRadius: BorderRadius.circular(4)),
                child: TextField(
                  controller: categoryController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 6),
              Text('price'),
              SizedBox(height: 6),
              Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 243, 242, 242),
                    borderRadius: BorderRadius.circular(4)),
                child: TextField(
                  controller: priceController,
                  keyboardType: TextInputType.numberWithOptions(signed: false),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      suffixIcon: Icon(
                        Icons.attach_money,
                        size: 20,
                      )),
                ),
              ),
              SizedBox(height: 6),
              Text('description'),
              SizedBox(height: 6),
              Container(
                height: 140,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 243, 242, 242),
                    borderRadius: BorderRadius.circular(4)),
                child: TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              BlocConsumer<AddBloc, AddorUpdateState>(
                listener: (context, state) {
                  if (state is AddorUpdateSuccess) {
                    print("herreee");
                    Navigator.pop(context);
                  } else if (state is AddorUpdateFailure) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('Failed to add')));
                  }
                },
                builder: (context, state) {
    //               if (state is AddorUpdateLoading) {
    //   return Center(child: CircularProgressIndicator());
    // }
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(500, 45),
                      backgroundColor: const Color.fromRGBO(63, 81, 243, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                    ),
                    onPressed: () => submitForm(context),
                    child: Text(
                      widget.product != null ? 'Update' : 'ADD',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
              SizedBox(height: 12),
              OutlinedButton(
                onPressed: () {
                  debugPrint('Delete pressed');
                },
                style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.red),
                    minimumSize: Size(500, 45),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4))),
                child: Text(
                  'Delete',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
