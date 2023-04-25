import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';

class ItemUtilityHotelWidget extends StatelessWidget {
  const ItemUtilityHotelWidget({Key? key}) : super(key: key);

  static const List<Map<String, String>> listUtilityHotel = [
    {'icon': AssetHelper.icoWifi, 'name': 'Wifi\nMiễn phí'},
    {'icon': AssetHelper.icoNonRefund, 'name': 'Không-\nhoàn trả'},
    {'icon': AssetHelper.icoBreakfast, 'name': 'Không-\nhoàn trả'},
    {'icon': AssetHelper.icoNonSmoke, 'name': 'Không-\nhút thuốc'},
  ];

  Widget _buildItemUtilityHotelWidget({required String icon, required String name}) {
    return Column(
      children: [
        ImageHelper.loadFromAsset(
          icon,
        ),
        SizedBox(
          height: kTopPadding,
        ),
        Text(name, textAlign: TextAlign.center,),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: listUtilityHotel
            .map(
              (e) => _buildItemUtilityHotelWidget(
                icon: e['icon']!,
                name: e['name']!,
              ),
            )
            .toList(),
      ),
    );
  }
}
