import 'package:barb/core/utils/exports.dart';
import 'package:stacked_services/stacked_services.dart';

class CustomDropdown<T> extends StatelessWidget {
  final String? label;
  final String? hint;
  final T? value;
  final List<T>? itemList;
  final List<DropdownMenuItem<T>>? dropdownItem;
  final ValueChanged<T?>? onChanged;
  final bool enabled, loading;
  final TextStyle? style;
  final String? helperText;
  final bool arrowColor;

  const CustomDropdown({
    Key? key,
    this.label,
    this.hint,
    required this.value,
    this.itemList,
    this.dropdownItem,
    required this.onChanged,
    this.style,
    this.helperText,
    this.loading = false,
    this.enabled = true,
    this.arrowColor = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label ==null ? SizedBox() : Container(
          margin: EdgeInsets.only(bottom: 0.w),
          child: Text(
            label!,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w300,
              color: Color(0xFF7A7991)
            ),
          ),
        ),
        loading ? DropDownLoader() : AbsorbPointer(
          absorbing: !enabled,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
            // margin: EdgeInsets.symmetric(horizontal: 5.w),
            decoration: BoxDecoration(
              // color: Colors.white,
              // borderRadius: BorderRadius.circular(7.r),
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFF707070),
                  width: .4
                )
              )
            ),
            child: DropdownButton<T>(
              style: style ?? Theme.of(context).textTheme.headline3!.copyWith(
                fontSize: 14.sp,
                color: Color(0xFFACACAC).withOpacity(.5),
              ),
              hint: hint == null ? SizedBox() : Text(
                hint!,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF7A7991)
                ),
              ),
              // focusColor: Color(0xFFB9B9B9).withOpacity(0.12),
              dropdownColor: Colors.white,
              elevation: 1,
              underline: SizedBox(
                height: .08.h,
              ),
              isDense: true,
              isExpanded: true,
              icon: enabled ? Icon(
                Icons.keyboard_arrow_down,
                color: arrowColor  ? Color(0xFFD5D5D5) : Color(0xFF718096).withOpacity(0.5),
                size: 26.w,
              ) : SizedBox(),
              value: value,
              items: dropdownItem != null ? dropdownItem : itemList == null ? [] : itemList!.map((T value) {
                return new DropdownMenuItem<T>(
                  value: value,
                  child: new Text(
                    '$value',
                    style: Theme.of(StackedService.navigatorKey!.currentContext!).textTheme.headline4!.copyWith(
                      fontSize: 16.sp,
                      color: Color(0xFFACACAC),
                    ),
                  ),
                );
              }).toList(),
              onChanged: onChanged
            ),
          ),
        ),
        helperText == null ? SizedBox.shrink() : SizedBox(height: 6.h,),
        helperText == null ? SizedBox.shrink() : Text(
          helperText!,
          style: Theme.of(context).textTheme.headline3!.copyWith(
            fontSize: 12.sp,
            color: BrandColors.grey9c,
          ),
        )
      ],
    );
  }
}

class DropDownLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 14.h),
      padding: EdgeInsets.symmetric(vertical: 8.h,),
      decoration: BoxDecoration(
        // color: Color(0xFFB9B9B9).withOpacity(0.12),
        // borderRadius: BorderRadius.circular(5.r)
        border: Border(
          bottom: BorderSide(
            color: Colors.black.withOpacity(.08),
            width: 1.3
          ),
        )
      ),
      child: Row(
        children: [
          Container(
            width: 20.h,
            height: 20.h,
            child: CircularProgressIndicator(strokeWidth: 2,)
          ),
          SizedBox(width: 10.w,),
          Expanded(
            child: Text(
              'Loading',
              style: Theme.of(context).textTheme.headline3!.copyWith(
                fontSize: 14.sp,
              ),
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down,
            color: Color(0xFF718096).withOpacity(0.5),
            size: 26.w,
          )
        ],
      )
    );
  }
}