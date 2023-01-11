import 'package:flutter/material.dart';
import 'package:supper_keep_money/core/app_export.dart';
import 'package:supper_keep_money/presentation/transaction/transaction_category/widgets/category_item_widget.dart';

class CategoryGroupWidget extends StatefulWidget {
  final String? titleGroup;
  const CategoryGroupWidget({Key? key, this.titleGroup}) : super(key: key);

  @override
  State<CategoryGroupWidget> createState() => _CategoryGroupWidgetState();
}

class _CategoryGroupWidgetState extends State<CategoryGroupWidget> {
  @override
  Widget build(BuildContext context) {
    final withScreen = MediaQuery.of(context).size.width;

    return CardDefaultWidget(
      width: withScreen - 40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  widget.titleGroup ?? '',
                  style: AppStyle.t20B,
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    color: AppColors.yellow500,
                    size: 30,
                  ))
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Wrap(
            alignment: WrapAlignment.start,
            spacing: 0,
            runSpacing: 16,
            children: List.generate(
              5,
              (index) => CategoryItemWidget(
                  iconUrl: AppPath.icClothes,
                  title: 'Clothes model',
                  width: (withScreen - 32 - 32) / 3),
            ),
          ),
        ],
      ),
    );
  }
}
