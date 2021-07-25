import 'package:flutter/cupertino.dart';
import 'package:barb/core/utils/date_format_utils.dart';
import 'package:barb/core/utils/exports.dart';

class DatePickerfield extends StatefulWidget {
  final String? label;
  final String? value;
  final String? placeholder;
  final DateTime? stopDate;
  final DateTime? startDate;
  final DateTime? initialDate;
  final ValueChanged<DateTime> onDateSelected;
  final bool enabled;

  DatePickerfield({
    Key? key,
    this.label,
    this.value,
    this.placeholder,
    this.stopDate,
    this.startDate,
    this.initialDate,
    required this.onDateSelected,
    this.enabled = true
  }) : super(key: key);

  @override
  _DatePickerfieldState createState() => _DatePickerfieldState();
}

class _DatePickerfieldState extends State<DatePickerfield> {
  String date = '';
  late DateTime dateTime;

  @override
  void initState() { 
    super.initState();
    if(widget.value != null) {
      date = widget.value!;
    }
    if(widget.initialDate != null) {
      dateTime = widget.initialDate!;
    } else {
      dateTime = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    }
  }

  Future showPicker(BuildContext context) async{
    final ThemeData theme = Theme.of(context);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return await showDatePicker(
          context: context,
          initialDate: dateTime,
          firstDate: widget.startDate ?? DateTime(1800),
          lastDate: widget.stopDate ?? DateTime(2050),
        ).then((value)  {
          if(value != null) {
            setState(() {
              date = DateFormatUtil.yyyymmdd.format(value);
              dateTime = value;
              widget.onDateSelected(value);
            });
          }
        });
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return await showModalBottomSheet(
          context: context,
          builder: (BuildContext builder) {
            return Container(
              height: 300.h,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (value) {
                  setState(() {
                    date = DateFormatUtil.yyyymmdd.format(value);
                    dateTime = value;
                    widget.onDateSelected(value);
                  });
                },
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                initialDateTime: dateTime,
                minimumYear: widget.startDate?.year ?? DateTime(1800).year,
                maximumYear: widget.stopDate?.year ?? DateTime(2050).year,
                minimumDate: widget.startDate ?? DateTime(1800),
                maximumDate: widget.stopDate ?? DateTime(2050),
              ),
            );
          }
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label ==null ? SizedBox() : Container(
          margin: EdgeInsets.only(bottom: 5.w),
          child: Text(
            widget.label!,
            style: Theme.of(context).textTheme.headline5!.copyWith(
              fontSize: 12.sp,
              fontWeight: FontWeight.w300,
              color: Color(0xFF7A7991)
            ),
          ),
        ),
        Container(
          // margin: EdgeInsets.symmetric(vertical: 14.h),
          child: InkWell(
            onTap: widget.enabled ? () async => await showPicker(context) : (){},
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFF707070),
                    width: .4
                  )
                )
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      date.isNotEmpty ? date : '${widget.placeholder}',
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                        fontSize: 14.sp,
                        color: Color(0xFFACACAC)
                      ),
                    ),
                  ),
                  // SvgPicture.asset(
                  //   'calendar'.svg,
                  //   color: BrandColors.primary,
                  //   width: 15.w,
                  // )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
