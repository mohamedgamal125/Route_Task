import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_task/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:route_task/presentation/cubit/cart_cubit/cart_state.dart';
import '../../domain/entities/product.dart';
import '../cubit/product_cubit/product_cubit.dart';
import '../cubit/product_cubit/product_state.dart';
import '../widgets/product_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        toolbarHeight: 120,
        backgroundColor: Colors.transparent,elevation: 0,
        title: Column(
          children: [
            Row(

              children: [
                Image.asset('assets/images/appbar.png'),
              ],
            ),
            SizedBox(height: 12,),
            Row(
              children: [
                Expanded(
                  flex: 12,

                  child: Container(
                    height: 45,
                    child: TextField(

                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff004182)),
                            borderRadius: BorderRadius.circular(30)),
                        prefixIcon: ImageIcon(
                            AssetImage("assets/images/searchicon.png"),
                            color: Color(0xff004182)),
                        labelText: "what do you search for? ",
                      ),
                    ),
                  ),
                ),

                Spacer(),
                ImageIcon(
                  AssetImage("assets/images/shoppingicon.png"),
                  color: Color(0xff004182),
                )
              ],
            ),
          ],
        ),
        // actions: [
        //   BlocBuilder<CartCubit, CartState>(
        //     builder: (context, state) {
        //       int itemCount = 0;
        //       if (state is CartLoaded) {
        //         itemCount = state.count;
        //       }
        //       return Stack(
        //         alignment: Alignment.center,
        //         children: [
        //           Icon(Icons.shopping_cart,size: 40,),
        //           if (itemCount > 0)
        //             Positioned(
        //               right: 8,
        //               top: 12,
        //               child: Container(
        //                 padding: EdgeInsets.all(4),
        //                 decoration: BoxDecoration(
        //                   color: Colors.red,
        //                   borderRadius: BorderRadius.circular(13),
        //                 ),
        //                 constraints: BoxConstraints(
        //                   minWidth: 16,
        //                   minHeight: 16,
        //                 ),
        //                 child: Text(
        //                   '$itemCount',
        //                   style: TextStyle(
        //                     color: Colors.white,
        //                     fontSize: 12,
        //                   ),
        //                   textAlign: TextAlign.center,
        //                 ),
        //               ),
        //             ),
        //         ],
        //       );
        //     },
        //   ),
        // ],
      ),


      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 16,
                crossAxisSpacing: 16.0,
                mainAxisExtent: MediaQuery.of(context).size.height - 652.h,
                crossAxisCount: 2,
              ),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                return ProductCard(state.products[index]);
              },
            );
          } else if (state is ProductError) {
            return Center(child: Text(state.message));
          } else {
            return Center(child: Text('No products found'));
          }
        },
      ),
    );
  }
}
