import 'package:barb/core/utils/exports.dart';

class DropdownMock extends StatelessWidget {
  final Widget title;

  const DropdownMock({
    Key? key,
    required this.title}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7.r),
        border: Border.all(
          color: Color(0xFFD9D9D9),
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: title),
          Icon(
            Icons.keyboard_arrow_down_rounded,
            size: 22 .w,
            color: Color(0xFFACACAC),
          )
        ],
      ),
    );
  }
}