import 'dart:ffi';

class ProductModel{
  String title;
  String desc;
  String imagUrl;
  Double price;
  Double mrp;
  int id;
  ProductModel({required this.id,required this.title,required this.desc,required this.imagUrl,required this.price,required this.mrp,});
}