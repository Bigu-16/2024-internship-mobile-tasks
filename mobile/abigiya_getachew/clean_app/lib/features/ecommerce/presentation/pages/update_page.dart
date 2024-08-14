import 'package:flutter/material.dart';

class UpdatePage extends StatelessWidget {
  const UpdatePage({super.key});

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
          icon: Icon(Icons.arrow_back_ios,
          size: 20,
          ),
          color: const Color.fromRGBO(63, 81, 243, 1),
        ),
        title: const Text('Add Product',
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
              Container(
                width: 400,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 243, 242, 242),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.broken_image_outlined,
                      size: 50,
                      ),
                      Text('upload image')
                    ],
                  ),
                ),
              ),
              SizedBox(height: 6),
              Text('name'),
              SizedBox(height: 6),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 243, 242, 242),
                  borderRadius: BorderRadius.circular(4)
                ),
                child: TextField(
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
                  borderRadius: BorderRadius.circular(4)
                ),
                child: TextField(
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
                  borderRadius: BorderRadius.circular(4)
                ),
                child: TextField(
                  keyboardType: TextInputType.numberWithOptions(signed: false),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.attach_money,
                    size: 20,
                    )
                  ),
                ),
              ),
              SizedBox(height: 6),
              Text('description'),
              SizedBox(height: 6),
              Container(
                height: 140,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 243, 242, 242),
                  borderRadius: BorderRadius.circular(4)
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(500, 45),
                  backgroundColor: const Color.fromRGBO(63, 81, 243, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)
                  ),
                ),
                onPressed: () {
                  debugPrint('Add Pressed');
                },
                child: Text(
                  'ADD',
                  style: TextStyle(color: Colors.white),
                ),
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
                    borderRadius: BorderRadius.circular(4)
                  )
                ),
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

