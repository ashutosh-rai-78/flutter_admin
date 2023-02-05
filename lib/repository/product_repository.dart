import 'package:flutter_admin/entitys/product_model.dart';

abstract class ProductRepository{
 Future<List<ProductModel>> featchProducts(int pageNo);
}