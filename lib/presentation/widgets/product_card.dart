import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:route_task/presentation/cubit/cart_cubit/cart_cubit.dart';
import '../../domain/entities/product.dart';

class ProductCard extends StatelessWidget {
  final Product item;

  ProductCard(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: CustomColors.borderColor,
          width: 3.0.w,
        ),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                child: Image.network(
                  item.images.isNotEmpty ? item.images[0] : "https://via.placeholder.com/150",
                  fit: BoxFit.cover,
                  width: 191.0.w,
                  height: 126.0.h,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.0.sp,
                        color: CustomColors.textColor,
                      ),
                    ),
                    SizedBox(height: 8.0.h),
                    Row(
                      children: [
                        Text(
                          'EGP ${item.price.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 14.0.sp,
                            color: CustomColors.textColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 16.0.w),
                        Text(
                          'EGP ${(item.price / (1 - item.discountPercentage / 100)).toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 11.0.sp,
                            color: CustomColors.oldPriceColor,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0.h),
                    Row(
                      children: [
                        Text(
                          'Review (${item.rating})',
                          style: TextStyle(
                            fontSize: 12.0.sp,
                            color: CustomColors.textColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 4.0.w),
                        SvgPicture.asset(
                          'assets/images/starIcon.svg',
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            context.read<CartCubit>().increment();
                          },
                          child: SvgPicture.asset(
                            'assets/images/plusCircleIcon.svg',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SvgPicture.asset(
            'assets/images/heartCircleIcon.svg',
          ),
        ],
      ),
    );
  }
}

class CustomColors {
  static Color textColor = const Color(0xFF06004F);
  static Color oldPriceColor = const Color(0xFF004182).withOpacity(0.6);
  static Color borderColor = const Color(0xFF004182).withOpacity(0.3);
}
