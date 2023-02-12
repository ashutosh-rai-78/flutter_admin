import 'package:flutter_admin/entitys/product_entity.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> featchProducts(int pageNo);
}
