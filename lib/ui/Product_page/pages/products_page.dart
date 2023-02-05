import 'package:flutter/material.dart';
import 'package:flutter_admin/common/wrapped_route.dart';
import 'package:flutter_admin/di/locator.dart';
import 'package:flutter_admin/ui/Product_page/view_models/products_view_model.dart';
import 'package:view_model_x/view_model_x.dart';

class ProductsPage extends StatelessWidget with RouteWrapper {
  const ProductsPage({super.key});

 @override
  Widget wrappedRoute(BuildContext context) => ViewModelProvider(
      create: (context) => ProductsViewModel(locator()), child: this);

  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      body: StateFlowBuilder(
        builder: (context, list) {
        
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: ((context, index) {
              final product = list[index];
            return ListTile(
              title: Text(product.title),
            );
          }));
        }, stateFlow: context.vm<ProductsViewModel>().stateFlow,
      ),
    );
  }
  
 

}