import 'package:barb/core/utils/exports.dart';

class DateRange extends StatefulWidget {
  @override
  _DateRangeState createState() => _DateRangeState();
}

class _DateRangeState extends State<DateRange> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          width: 310.w,
          height: 280.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'From:',
                            style: Theme.of(context).textTheme.headline6!.copyWith(
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w800
                            ),
                          ),
                          SizedBox(height: 8.h,),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.h),
                            decoration: BoxDecoration(
                              color: BrandColors.greyF6,
                              border: Border.all(color: BrandColors.darkD9),
                              borderRadius: BorderRadius.circular(5.r)
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 90.w,
                                ),
                                SvgPicture.asset(
                                  'calendar'.svg,
                                  width: 12.w,
                                  color: BrandColors.dark59,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'To:',
                            style: Theme.of(context).textTheme.headline6!.copyWith(
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w800
                            ),
                          ),
                          SizedBox(height: 8.h,),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.h),
                            decoration: BoxDecoration(
                              color: BrandColors.greyF6,
                              border: Border.all(color: BrandColors.darkD9),
                              borderRadius: BorderRadius.circular(5.r)
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 90.w,
                                ),
                                SvgPicture.asset(
                                  'calendar'.svg,
                                  width: 12.w,
                                  color: BrandColors.dark59,
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 25.h,),
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    width: 180.w,
                    decoration: BoxDecoration(
                      color: BrandColors.primary,
                      borderRadius: BorderRadius.circular(6.r)
                    ),
                    child: Center(
                      child: Text(
                        'Apply',
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    )
                  ),
                  SizedBox(height: 10.h,),
                  InkWell(
                    borderRadius: BorderRadius.circular(6.r),
                    onTap: ()  => Navigator.of(context, rootNavigator: true).pop(),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      width: 180.w,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(6.r)
                      ),
                      child: Center(
                        child: Text(
                          'Close',
                          style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: BrandColors.primary,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                      )
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}