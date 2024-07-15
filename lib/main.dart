import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dio/dio.dart';
import 'package:route_task/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:route_task/presentation/cubit/product_cubit/product_cubit.dart';
import 'data/data_source/product_remote_data_source.dart';
import 'data/repositories/product_repository_impl.dart';
import 'domain/use_cases/get_all_products.dart';
import 'presentation/pages/home_page.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(

      designSize: Size(430, 950),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => setupProductCubit(),
          ),
          BlocProvider(
            create: (_) => CartCubit(),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(
            useMaterial3: false,

            //backgroundColor: Colors.white,
          ),
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        ),
      ),
    );
  }
}
ProductCubit setupProductCubit() {
  final dio = Dio();
  final productRemoteDataSource = ProductRemoteDataSource(dio);
  final productRepository = ProductRepositoryImpl(productRemoteDataSource);
  final getAllProductsUseCase = GetAllProducts(productRepository);
  return ProductCubit(getAllProductsUseCase)..fetchAllProducts();
}
