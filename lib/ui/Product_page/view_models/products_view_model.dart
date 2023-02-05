import 'dart:collection';

import 'package:flutter_admin/entitys/product_model.dart';
import 'package:flutter_admin/repository/product_repository.dart';
import 'package:view_model_x/view_model_x.dart';

class ProductsViewModel extends ViewModel {
  final ProductRepository _productRepository;
  ProductsViewModel(this._productRepository);

  final _stateFlow = MutableStateFlow<List<ProductModel>>([]);
  StateFlow<List<ProductModel>> get stateFlow => _stateFlow; 

  @override
  void init() {
      fetch(1);
  }

  void fetch(int page) async{
    final productList = await _productRepository.featchProducts(page);
    // _stateFlow.value = productList;
    _stateFlow.update((value) {
      if (page == 1){
        value.clear();
      }
      value.addAll(productList);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
