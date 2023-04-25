import 'package:flutter/material.dart';

import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/constants/textstyle_ext.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/representation/widgets/dash_line.dart';
import 'package:travel_app/representation/widgets/item_button_widget.dart';
import 'package:travel_app/representation/widgets/item_utility_hotel.dart';

import '../../data/model/room_model.dart';

class ItemRoomWidget extends StatelessWidget {
  const ItemRoomWidget({
    Key? key,
    required this.roomModel,
    this.onTap,
    this.numberOfRoom,
  }) : super(key: key);

  final RoomModel roomModel;
  final Function()? onTap;
  final int? numberOfRoom;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kMediumPadding),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(bottom: kMediumPadding),
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      roomModel.roomName,
                      style: TextStyles.defaultStyle.fontHeader.bold,
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    Text(
                      'Kích thước phòng: ${roomModel.size} m2',
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    Text(
                      roomModel.utility,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: ImageHelper.loadFromAsset(roomModel.roomImage, radius: BorderRadius.circular(kItemPadding)),
              ),
            ],
          ),
          ItemUtilityHotelWidget(),
          DashLineWidget(),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$${roomModel.price.toString()}',
                      style: TextStyles.defaultStyle.fontHeader.bold,
                    ),
                    SizedBox(
                      height: kMinPadding,
                    ),
                    Text(
                      '/Đêm',
                      style: TextStyles.defaultStyle.fontCaption,
                    )
                  ],
                ),
              ),
              Expanded(
                child: numberOfRoom == null
                    ? ItemButtonWidget(
                        data: 'Chọn',
                        onTap: onTap,
                      )
                    : Text(
                        '$numberOfRoom phòng',
                        textAlign: TextAlign.end,
                      ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
