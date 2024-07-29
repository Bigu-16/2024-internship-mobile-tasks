import 'dart:io';

void main(){
  ProductManager prod = ProductManager();
  int x = 0;
  while (x != 6){
    print('Menu');
    print('1. Add product');
    print('2. View all products');
    print('3. View single product');
    print('4. Edit product');
    print('5. Delete producut');
    print('6. Exit');
    
    x = int.parse(stdin.readLineSync() ?? '0');
    
    switch (x){
    case 1:
      prod.addProduct();
      break;
    case 2:
      prod.viewAllProduct();
      break;
    case 3:
      prod.viewSingleProduct();
      break;
    case 4:
      prod.editProduct();
      break;
    case 5:
      prod.deleteProduct();
      break;
    case 6:
      x = 6;
      break;
    }
  }
}

class Product{
  String? name;
  String? description;
  double? price;

  Product(String? name, String? description, double? price){
    this.name = name;
    this.description = description;
    this.price = price;
  }
}



class ProductManager{ 
  List<Product> productsList = [];

  void addProduct(){
    print('Enter product name: ');
    String? name = stdin.readLineSync();
    print('Enter product description: ');
    String? description = stdin.readLineSync();
    print('Enter product price: ');
    double price = double.parse(stdin.readLineSync() ?? '0');

    Product p = Product(name, description, price);
    productsList.add(p);

  }

  void viewAllProduct(){
    for (var product in productsList){
      print(product.name);
      print(product.description);
      print(product.price);
    }

  }

  void viewSingleProduct(){
      print('Enter the number of the product you want to view: ');

      int x = 1;
      for (var product in productsList){
        print('$x.${product.name}');
        x++;
      }

      int? idx = int.parse(stdin.readLineSync() ?? '0');
      print(productsList[idx - 1].name);
      print(productsList[idx - 1].description);
      print(productsList[idx - 1].price);
    }
  
  void editProduct(){
    print('Enter the number of the product you want to edit: ');

      int x = 1;
      for (var product in productsList){
        print('$x.${product.name}');
        x++;
    }

    int? idx = int.parse(stdin.readLineSync() ?? '0');

    print('Current prduct\'s name:${productsList[idx - 1].name}. Please enter the new product name: ');
    String? new_name = stdin.readLineSync();
    productsList[idx - 1].name = new_name;

    print('Current product\'s description: ${productsList[idx - 1].description}. Please enter the new desription: ');
    String? new_description = stdin.readLineSync();
    productsList[idx - 1].description = new_description;

    print('Current product\'s price: ${productsList[idx - 1].price}. Please enter the new price: ');
    double? new_price = double.parse(stdin.readLineSync() ?? '0');
    productsList[idx - 1].price = new_price;
  }

  void deleteProduct(){
    print('Enter the number of the product you want to delete: ');

      int x = 1;
      for (var product in productsList){
        print('$x.${product.name}');
        x++;
    }

    int? idx = int.parse(stdin.readLineSync() ?? '0');
    productsList.removeAt(idx - 1);
  }
  
}