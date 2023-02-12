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
      backgroundColor: Theme.of(context).colorScheme.background,
      body: StateFlowBuilder(
        builder: (context, list) {
          return GridView.builder(
            itemCount: list.length,
            itemBuilder: ((context, index) {
              final product = list[index];
              return Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: ListTile(
                  title: Text(product.title),
                  subtitle: Text(product.desc),
                  leading: Text(product.imagUrl),
                  trailing:
                      Text(" MRP: ${product.mrp} Price: ${product.price}"),
                ),
              );
            }),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 500,
                childAspectRatio: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
          );
        },
        stateFlow: context.vm<ProductsViewModel>().stateFlow,
      ),
    );
  }
}
