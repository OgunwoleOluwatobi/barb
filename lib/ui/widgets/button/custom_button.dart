import 'package:barb/core/utils/exports.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function func;
  final bool filled;
  final bool disable;
  final bool dark;
  final Color? color;
  final Color? textColor;
  final double? textSize;
  final EdgeInsets? padding;

  const CustomButton({
    Key? key,
    required this.title,
    required this.func,
    this.filled = true,
    this.color,
    this.dark = false,
    this.textColor,
    this.textSize,
    this.padding,
    this.disable = false}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => func(),
      borderRadius: BorderRadius.circular(7.r),
      child: Container(
        padding: padding ?? EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
        width: double.infinity,
        decoration: BoxDecoration(
          color: disable ? Color(0xFFF18988) : filled ?color == null ? dark ? BrandColors.secondary : BrandColors.primary : color : Colors.transparent,
          border: Border.all(
            color: disable ? Color(0xFFF18988) : !filled ? color != null ? color! : dark ? BrandColors.secondary :  BrandColors.primary : Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(5.r)
        ),
        child: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '$title',
              style: Theme.of(context).textTheme.headline5!.copyWith(
                color: textColor == null ? filled || color != null ? Colors.white : BrandColors.primary : textColor,
                fontSize: textSize ?? 14.sp,
                fontWeight: FontWeight.w400
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}