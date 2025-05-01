import 'package:abnayiy_wallet/Shared/Base/common/shared.dart';
import 'package:flutter/cupertino.dart';

class ImagePlacholderWidget extends StatelessWidget{
  final int generTypeId ;
  const ImagePlacholderWidget({super.key, required this.generTypeId});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        generTypeId == 1 ? 'assets/images/Rectangle.png' :    'assets/images/mahmoud.png',
        height: Shared.width * 0.25,
        width: Shared.width * 0.25,
        fit: BoxFit.cover,
      ),
    );
  }

}