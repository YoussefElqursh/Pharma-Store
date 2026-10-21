import 'package:flutter/cupertino.dart';
import 'package:pharma_store_store_web/shared/styles/flutter_icons_icons.dart';

class DataCardModel {
  DataCardModel(this.cardTitle, this.cardNumber, this.cardIcon, this.cardImage,
      this.cardPercentage, this.cardState, this.color);

  final String cardTitle;
  final String cardNumber;
  final String cardImage;
  final IconData cardIcon;
  final String color;
  final String cardPercentage;
  final bool cardState;
}

//------------------------------------------------------------------------------
//this list data of card

List<DataCardModel> dataList = [
  DataCardModel('Total Products', '1250', FlutterIcons.product, 'assets/icons/path.svg', '15%', true, '#8280FF'),
  DataCardModel('Total Orders', '200', FlutterIcons.order, 'assets/icons/path (1).svg', '12%', false, '#FF9066'),
];
