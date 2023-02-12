import 'package:flutter_admin/entitys/product_entity.dart';
import 'package:flutter_admin/repository/product_repository.dart';

class MockProductRepository extends ProductRepository {
  List<ProductModel> pL = [
    ProductModel(
        id: 1,
        title: "MacBook Air M1",
        desc: "desc",
        imagUrl: "imagUrl",
        price: 100.0,
        mrp: 120.00),
    ProductModel(
        id: 2,
        title: "MacBook Air M2",
        desc: "desc",
        imagUrl: "imagUrl",
        price: 100.0,
        mrp: 120.00),
    ProductModel(
        id: 3,
        title: "MacBook Pro M1",
        desc: "desc",
        imagUrl: "imagUrl",
        price: 100.0,
        mrp: 120.00),
    ProductModel(
        id: 4,
        title: "MacBook Pro M2",
        desc: "desc",
        imagUrl: "imagUrl",
        price: 100.0,
        mrp: 120.00),
    ProductModel(
        id: 5,
        title: "MacBook Pro Max M1",
        desc: "desc",
        imagUrl: "imagUrl",
        price: 100.0,
        mrp: 120.00),
  ];

  @override
  Future<List<ProductModel>> featchProducts(int pageNo) async {
    await Future.delayed(const Duration(seconds: 1));
    return pL;
  }
}
