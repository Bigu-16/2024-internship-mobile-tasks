import 'package:clean_app/features/authenticatoin/presentation/widgets/text_of_fields.dart';
import 'package:clean_app/features/ecommerce/domain/entities/product.dart';
import 'package:clean_app/features/ecommerce/presentation/BLoC/add_and_update/add_and_update_bloc.dart';
import 'package:clean_app/features/ecommerce/presentation/BLoC/add_and_update/add_and_update_event.dart';
import 'package:clean_app/features/ecommerce/presentation/BLoC/add_and_update/add_and_update_state.dart';
import 'package:clean_app/features/ecommerce/presentation/BLoC/delete_block/delete_bloc.dart';
import 'package:clean_app/features/ecommerce/presentation/BLoC/delete_block/delete_event.dart';
import 'package:clean_app/features/ecommerce/presentation/BLoC/delete_block/delete_state.dart';
import 'package:clean_app/features/ecommerce/presentation/BLoC/home_bloc/home_page_bloc.dart';
import 'package:clean_app/features/ecommerce/presentation/BLoC/home_bloc/home_page_event.dart';
import 'package:clean_app/features/ecommerce/presentation/pages/home_page.dart';
import 'package:clean_app/features/ecommerce/presentation/widgets/search_image_picker.dart';
import 'package:flutter/cupertino.dart';
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
      context.read<UpdateBloc>().add(AddData(
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
  void initState() {
    super.initState();
    if (widget.product != null) {
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          toolbarHeight: 30,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
            ),
            color: const Color.fromARGB(255, 63, 81, 243),
          ),
          title: const Text(
            'Add Product',
            style: TextStyle(fontSize: 16),
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

                CustomTextField(
                  label: 'Name', 
                  newController: nameController, 
                  placeholder: ''),

                SizedBox(height: 6),

                CustomTextField(
                  label: 'Category', 
                  newController: categoryController, 
                  placeholder: ''),

                SizedBox(height: 6),

                CustomTextField(
                  label: 'Price', 
                  newController: priceController, 
                  placeholder: ''),

                SizedBox(height: 6),

                Text('Description',
                style: TextStyle(color: Color.fromARGB(255, 136, 136, 136)),
                ),

                SizedBox(height: 6),
                Container(
                  height: 140,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 250, 250, 250),
                      borderRadius: BorderRadius.circular(4)),
                  child: TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                MultiBlocListener(
                  listeners: [
                    BlocListener<AddBloc, AddorUpdateState>(
                      listener: (context, state) {
                        if (state is AddorUpdateSuccess) {
                          context.read<HomePageBloc>().add(FetchData());
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        } else if (state is AddorUpdateFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Failed to add')));
                        }
                      },
                    ),
                    BlocListener<UpdateBloc, AddorUpdateState>(
                      listener: (context, state) {
                        if (state is AddorUpdateSuccess) {
                          context.read<HomePageBloc>().add(FetchData());
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        } else if (state is AddorUpdateFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Failed to update')));
                        }
                      },
                    )
                  ],
                  child: BlocBuilder<AddBloc, AddorUpdateState>(
                    builder: (context, state) {
                        if (state is AddorUpdateLoading) {
                        return Center(child: CupertinoActivityIndicator());
                      }
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(500, 45),
                          backgroundColor: const Color.fromARGB(255, 63, 81, 243),
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
                ),
                SizedBox(height: 12),
                BlocListener<DeleteBloc, DeleteState>(
                  listener: (context, state) {
                    if (state is DeleteSuccess) {
                      context.read<HomePageBloc>().add(FetchData());
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('successfully deleted')));
                    } else if (state is DeleteFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Failed to delete')));
                    }
                  },
                  child: OutlinedButton(
                    onPressed: () {
                      context
                          .read<DeleteBloc>()
                          .add(DeleteData(widget.product!.id));
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
